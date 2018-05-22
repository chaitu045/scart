<?php

class ISC_ADMIN_GOOGLEPS extends ISC_ADMIN_BASE {

	public function __construct()
	{
		parent::__construct();
	}

	public function HandleToDo($todo)
	{
		GetLib('class.json');

		// todo method name
		$todo = $todo . 'Action';

		// the page to render is returned as a string from the action
		$render = null;

		// process action routing
		if (method_exists($this, $todo) || method_exists($this, '__call')) {
			$render = $this->$todo();
		}

		// process template routing
		if ($render && is_string($render)) {
			if ($this->renderLayout) {
				$this->engine->printHeader();
			}

			$this->template->display($render . '.tpl');

			if ($this->renderLayout) {
				$this->engine->printFooter();
			}
		}
	}

	public function getCountries()
	{
		return ISC_ADMIN_GOOGLEPS_TAXONOMY::getCountries();
	}

	public function getGooglePsCategoriesAction()
	{
		$request = new Interspire_Request;
		$categoryid = (integer) $request->request('categoryid');

		if ($categoryid >= 0) {
			if (!empty($_REQUEST['all']))
				$parents = ISC_ADMIN_GOOGLEPS_TAXONOMY::getParentCategories($categoryid);
			else
				$parents[] = $categoryid;

			$selectedid = $categoryid;
			foreach ($parents as $parentid) {
				$html = $this->getCategorySelectBoxHTML($parentid, $selectedid);
				$boxes[] = array(
					 'html' => $html,
					 'categoryid' => $parentid,
				);

				$selectedid = $parentid;
			}

			$output = array(
				 'boxes' => $boxes,
				 'categoryid' => $categoryid
			);
		}

		ISC_JSON::output('', true, $output);
	}

	/**
	 * Generates a html fragment containing a selectable list of children
	 * categories for the given parent id.
	 *
	 * @param integer Parent category id
	 * @param object The category taxonomy object
	 * @param integer (optional) A category id to mark as pre selected
	 */
	private function getCategorySelectBoxHTML($parentid, $selectedid)
	{
		$categories = ISC_ADMIN_GOOGLEPS_TAXONOMY::getSubCategories($parentid);

		$this->template->assign('parentid', $parentid);
		$this->template->assign('categories', $categories);
		$this->template->assign('selectedid', $selectedid);

		return $this->template->render('googleps.categorybox.tpl');
	}

	/**
	 * This function will return the google category based on the store category.
	 *
	 * @param int $categoryId
	 * @param int $flag This is the status flag of Google Taxonomies. 0 = archive, 1 = completed and 2 = incomplete.
	 * @return mixed Return array contain of the database results if the query returns result. Otherwise, return false
	 */
	public function getGooglePsCategory($categoryId, $flag = 1)
	{
		$flagQuery = "";
		if ($flag !== false) {
			$flagQuery = " AND gpsc.flag  = '".(int)$flag."'";
		}
		$query = "
			SELECT gpsc.*, CONCAT_WS(' > ', gpsc.path, gpsc.name) AS full_path
			FROM [|PREFIX|]google_ps_category_associations gps
			JOIN [|PREFIX|]google_ps_categories gpsc ON
				(gps.google_ps_categories_id = gpsc.google_ps_category_id " . $flagQuery . ")
			WHERE gps.categoryid = '". (int)$categoryId ."'
			LIMIT 1
		";
		$res = $this->db->query($query);
		return $this->db->fetch($res);
	}

	/**
	 * @todo handle exceptions from the save method
	 */
	public function getGooglePsBulkUpdateAction()
	{
		$request = new Interspire_Request;
		$googleCategoryId = (integer) $request->request('categoryid');
		$productCategories = $request->post('categories');

		foreach($productCategories as $categoryId => $on) {
			$this->delete($categoryId);
			$this->save($googleCategoryId, $categoryId);
		}

		$output = array("result"=>"success");
		ISC_JSON::output('', true, $output);
	}

	public function delete($categoryId)
	{
		if ($this->db->DeleteQuery("google_ps_category_associations", "WHERE categoryid = '$categoryId'")) {
			// update the googls ps enabled flag on category table.
			$updateData = array("google_ps_enabled" => 0);
			return $this->db->UpdateQuery("categories", $updateData, "categoryid = '$categoryId'");
		}
		return false;
	}

	public function save($googlePsCategoryId, $categoryId)
	{
			$newData = array(
				"google_ps_categories_id" => (int)$googlePsCategoryId,
				"categoryid" => (int)$categoryId,
			);

			if($GLOBALS['ISC_CLASS_DB']->InsertQuery("google_ps_category_associations", $newData)) {
				// update the googls ps enabled flag on category table.
				$updateData = array("google_ps_enabled" => 1);
				return $this->db->UpdateQuery("categories", $updateData, "categoryid = '$categoryId'");
			}
			return false;
	}
}
