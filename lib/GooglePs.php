<?php

class GooglePs
{
	const INCOMPLETE_FLAG = 2;
	const COMPLETE_FLAG = 1;
	const ARCHIVE_FLAG = 0;

	private $localCategories = null;

	private $remoteCategories = null;

	private $lastInsertedCatId = null;

	private $db = null;

	public function __construct()
	{
		$this->db = $GLOBALS['ISC_CLASS_DB'];
	}

	public function setRemoteGoogleCategories()
	{
		// checking if the remote google cats already loaded
		if ($this->remoteCategories === null) {

			$response = PostToRemoteFileAndGetResponse(GetConfig('GoogleProductSearchCategoriesUrl'));

			// Convert the text file to array
			$this->remoteCategories = $this->extractRemoteGoogleCats($response);
		}
	}

	/**
	 * This function will sanitize/process the categories path return from Google server.
	 *
	 * @param string $response Categories from google server
	 * @return Mixed Return false if the categories file's invalid or empty. Otherwise return the clean category path.
	 */
	private function extractRemoteGoogleCats($response)
	{
			$response = trim($response);
			if (empty ($response)) {
				return false;
			}
			$response = explode("\n", $response);

			$cleanResponse = array();
			$regex = "/^ *#/";
			foreach ($response as $catPath) {

				// Skip the commented string as google treat "#" as comment.
				if (preg_match($regex, $catPath)) {
					continue;
				}
				$cleanResponse[] = trim($catPath);
			}

			if (!empty ($cleanResponse)) {
				return $cleanResponse;
			}
			return false;
	}

	private function setLocalGoogleCategories()
	{
		// checking if the local google cats already loaded
		if ($this->localCategories === null) {
			$query = "
				SELECT google_ps_category_id, path, parent_id, IF(parent_id != 0,CONCAT_WS(' > ', path, name),name) as 'full_path'
				FROM [|PREFIX|]google_ps_categories
				WHERE flag = '".self::COMPLETE_FLAG."'
			";

			$res = $this->db->query($query);
			while($row = $this->db->fetch($res)) {
				$this->localCategories[$row['google_ps_category_id']] = $row['full_path'];
			}
		}
	}

	private function applyNewCategories()
	{
		// Init the remote and local cats.
		$this->setRemoteGoogleCategories();
		$this->setLocalGoogleCategories();

 		// if the remote categories weren't loaded sucessfully
		if ($this->remoteCategories === false) {
			return false;
		}

		// Get the last inserted category and add it to our class property.
		$this->lastInsertedCatId = $this->getLastGooglePsCatId();

		// list of insert queries
		$insertData = array();

		// Retrieve the new added categories.
		$newCategories = array_diff($this->remoteCategories, $this->localCategories);
		foreach($newCategories as $newCategory) {
			$currentPath = $newCategory;

			// Add the leaf category.
			$insertData[$this->generateUniqueCategoryPath($currentPath)] = $this->generateNewCatData($currentPath);

			// We will need to add its parent category if it's not exists.
			while ($this->isParentCatNotExist($currentPath)) {

				// Extract its parent path
				$parentPath = $this->getPath($currentPath, "parent");

				// if we reach the top category, break thru the loop
				if (empty ($parentPath)) {
					break;
				}

				// Process the parent path
				$parentPathKey = $this->generateUniqueCategoryPath($parentPath);
				if (!array_key_exists($parentPathKey, $insertData)) {
					$insertData[$parentPathKey] = $this->generateNewCatData($parentPath);
				}

				$currentPath = $parentPath;
			}
		}

		// insert all the new categories as incomplete state.
		if (!$this->insertNewCategory($insertData)) {
			return false;
		}

		// update all new categories' numChild and parentId
		return $this->postNewCategoryApplication();
	}


	private function postNewCategoryApplication()
	{
		$allCategories = $this->getAllGoogleCategories();
		$modifiedCats = array();

		// working out the parent id and children number
		foreach ($allCategories as $key=>$category) {

			// get the md5 of its parent as the array key
			$uniquePath = $this->generateUniqueCategoryPath($category['path']);

			if ($category['flag'] == self::INCOMPLETE_FLAG) {

				// if the category has parent.
				if (isset ($allCategories[$uniquePath])) {
					$allCategories[$key]['parent_id'] = $allCategories[$uniquePath]['google_ps_category_id'];
					$allCategories[$uniquePath]['num_children'] = ++$allCategories[$uniquePath]['num_children'];
					$modifiedCats[$uniquePath] = $allCategories[$uniquePath];
				}
				$allCategories[$key]['flag'] = self::COMPLETE_FLAG;
				$modifiedCats[$key] = $allCategories[$key];
			}
		}

		if (!empty ($modifiedCats)) {

			// update the categories.
			foreach($modifiedCats as $modifiedCat) {
				// init the category vars to hold
				$categoryIds = array();
				$categoryIds[$modifiedCat['google_ps_category_id']] = array($modifiedCat['google_ps_category_id']);

				// unset all the variables that we don't it to be updated.
				unset ($modifiedCat['id']);
				unset ($modifiedCat['full_path']);

				if (!$this->updateCategories($categoryIds, $modifiedCat)) {
					return false;
				}
			}
		}
		return true;
	}

	private function getAllGoogleCategories()
	{
		$allCategories = array();
		$query = "SELECT *, CONCAT_WS(' > ', path, name) as 'full_path'
			FROM [|PREFIX|]google_ps_categories
			";
		$res = $this->db->Query($query);
		while ($row = $this->db->fetch($res)) {
			$uniqueFullPath = $this->generateUniqueCategoryPath($row['full_path']);
			$allCategories[$uniqueFullPath] = $row;
		}
		return $allCategories;
	}

	private function insertNewCategory($insertData)
	{
		if (empty ($insertData)) {
			return false;
		}

		$insertQuery = array();

		foreach ($insertData as $eachInsertData) {
			$insertQuery[] = "('" . implode("','", $eachInsertData) . "')";
		}

		$insertQuery = implode(",", $insertQuery);

		$query = "INSERT INTO [|PREFIX|]google_ps_categories
			(google_ps_category_id, parent_id, name, path, num_children, flag)
			VALUES "
			. $insertQuery;
		if (!$this->db->query($query)) {
			$this->db->RollbackTransaction();
			return false;
		}
 		return true;
	}

	private function isParentCatNotExist($path)
	{
		$parentPath = $this->getPath($path, "parent");

		// find if the parent path exists.
		return !(bool)array_search($parentPath, $this->localCategories);
	}

	private function getPath($path, $type = "both")
	{
		preg_match('/(.*)(( > )|^)(.+)/', $path, $matches);
		if (empty ($matches)) {
			return false;
		}

		// return the parent path
		if (isc_strtolower($type) == "parent") {
			return $matches[1];
		}
		// return base path
		elseif (isc_strtolower($type) == "base") {
			return $matches[4];
		}
		// return both base and parent path
		return array ("base" => $matches[4], "parent" => $matches[1]);
	}

	private function generateNewCatData($path)
	{
		$paths = $this->getPath($path);
		return $data = array(
			 'googlePsCategoryId' => ++$this->lastInsertedCatId,
			 'parentId' => 0,
			 'name' => $this->db->Quote($paths['base']),
			 'path' => $this->db->Quote($paths['parent']),
			 'numChildren' => 0,
			 'flag' => self::INCOMPLETE_FLAG,
		);
	}

	private function generateUniqueCategoryPath($path)
	{
		$paths = $this->getPath($path);
		if (empty ($paths["parent"])) {
			return md5($paths["base"]);
		}
		return md5($paths["parent"] . " > " . $paths["base"]);
	}

	private function applyOldCategories()
	{
		// Init the remote and local cats.
		$this->setRemoteGoogleCategories();
		$this->setLocalGoogleCategories();

 		// if the remote categories weren't loaded sucessfully
		if ($this->remoteCategories === false) {
			return false;
		}

		// Get all the old categories.
		$oldCategories = array_diff($this->localCategories, $this->remoteCategories);
		$oldCategoriesIds = implode("','", array_keys($oldCategories));

		// Update the table to set the flag to disable
		$gpsCatData = array('flag' => self::ARCHIVE_FLAG);
		return $this->updateCategories($oldCategories, $gpsCatData);
	}

	private function getLastGooglePsCatId()
	{
		$query = "SELECT MAX(google_ps_category_id)
			FROM [|PREFIX|]google_ps_categories
		";
		$res = $this->db->query($query);
		return $this->db->fetchOne($res);
	}

	private function updateCategories($categoryIds, $gpsCatData)
	{
		if (!empty ($categoryIds)) {
			$oldCategoriesIds = implode("','", array_keys($categoryIds));
			if (!$this->db->UpdateQuery("google_ps_categories", $gpsCatData, "google_ps_category_id IN ('".$oldCategoriesIds."')")) {
				$this->db->RollbackTransaction();
				return false;
			}
		}
		return true;
	}

	public function processCategoriesSync()
	{
		// start a database transaction
		$this->db->StartTransaction();

		// begin applying new categories to local gps categories
		if(!$this->applyNewCategories()) {
			return false;
		}

		if (!$this->applyOldCategories()) {
			return false;
		}

		// commit the database changes, only if all the process success.
		return $this->db->CommitTransaction();

	}

	/**
	 * This function check if the store has any store category that has mapped to
	 * google product search category which has been removed or updated.
	 *
	 * @return array Return an empty array if the category mapping is valid. Otherwise, return an array with list of invalid categories.
	 */
	public function getInvalidCategoriesMapping($maxCatNameLen = 40)
	{
		$invalidCatsMapping = array();
		$query = "
			SELECT c.categoryid, c.catname, gpsc.name AS gps_category_name, gpsc.google_ps_category_id FROM [|PREFIX|]google_ps_category_associations gpsca
			JOIN [|PREFIX|]categories c ON (c.categoryid = gpsca.categoryid)
			JOIN [|PREFIX|]google_ps_categories gpsc ON (gpsc.google_ps_category_id = gpsca.google_ps_categories_id AND gpsc.flag = '0')
		";

		$res = $this->db->query($query);
		while($row = $this->db->fetch($res)) {
			$invalidCatsMapping[$row['categoryid']]['gpsCatName'] = (isc_strlen($row['gps_category_name']) > $maxCatNameLen) ? isc_substr($row['gps_category_name'], 0, $maxCatNameLen) . "..." : $row['gps_category_name'];
			$invalidCatsMapping[$row['categoryid']]['gpsCatId'] = $row['google_ps_category_id'];
		}
		return $invalidCatsMapping;
	}

	/**
	 * This function check if there's inactive google category being used in the store
	 *
	 * @return bool Return true if there's inactive google category being used in the store
	 */
	public function isAnyInactiveGoogleCategories()
	{
		// Check if we are using any inactive google categories.
		$query = "
			SELECT COUNT(*) FROM [|PREFIX|]google_ps_category_associations gpsca
			JOIN [|PREFIX|]google_ps_categories gpsc ON
				(gpsc.google_ps_category_id = gpsca.google_ps_categories_id
				AND gpsc.flag = 0
				)
			";

		$res = $this->db->query($query);
		return (bool)$this->db->fetchOne($res);
	}

	/**
	 *
	 * @param int $maxCatNameLen The length of the string that we allowed before we truncate it.
	 * @return array Return a blank array if no result found. Otherwise return the array with Google Category's Id name Name
	 */
	public function getInvalidGoogleCategoriesMapping($maxCatNameLen = 40)
	{
		// Check if we are using any inactive google categories.
		$query = "
			SELECT DISTINCT gpsc.google_ps_category_id, gpsc.name FROM [|PREFIX|]google_ps_category_associations gpsca
			JOIN [|PREFIX|]google_ps_categories gpsc ON
				(gpsc.google_ps_category_id = gpsca.google_ps_categories_id
				AND gpsc.flag = 0
				)
			";

		$invalidCatsMapping = array();
		$res = $this->db->query($query);
		while($row = $this->db->fetch($res)) {
			$invalidCatsMapping[] = array(
				 'id' => $row['google_ps_category_id'],
				 'name' => (isc_strlen($row['name']) > $maxCatNameLen) ? isc_substr($row['name'], 0, $maxCatNameLen) . "..." : $row['name']
			);
		}
		return $invalidCatsMapping;
	}

	/**
	 * This function replace the the archive google category mapping by the new selected google taxonomy.
	 *
	 * @param int $oldTaxonomy The archive google taxonomy
	 * @param int $newTaxonomy The new selected google taxonomy that will replate the $oldTaxonomy
	 * @return bool return true if the category mapping's updated. Otherwise, return false
	 */
	public function UpdateGoogleTaxonomyMapping($oldTaxonomy, $newTaxonomy)
	{
		if (!isId($oldTaxonomy) || !isId($newTaxonomy)) {
			return false;
		}

		$gpsCatData = array('google_ps_categories_id' => $newTaxonomy);
		if (!$this->db->UpdateQuery("google_ps_category_associations", $gpsCatData, "google_ps_categories_id = '$oldTaxonomy'")) {
			return false;
		}
		return true;
	}

	/**
	 * This function check if we need to check for google taxonomies for data consistent.
	 */
	public function isGoogleTaxonomiesExpired()
	{
		$nextCheckTimestamp = GetConfig("GoogleTaxonomiesLastChecked") + GetConfig("GoogleTaxonomiesCheckedPeriod");
		return $nextCheckTimestamp < time();
	}
}