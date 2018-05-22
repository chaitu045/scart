<?php

if (!defined('ISC_BASE_PATH')) {
	die();
}

class ISC_ADMIN_REMOTE_GOOGLEPS extends ISC_ADMIN_REMOTE_BASE
{
	public function __construct()
	{
		GetLib('class.json');
		parent::__construct();
	}

	/**
	* @return mixed
	*/
	public function HandleToDo ()
	{
		$what = @$_REQUEST['w'];
		$methodName = 'handle' . $what;

		if(!method_exists($this, $methodName)) {
			exit;
		}

		$this->$methodName();
	}

	public function handleClearLastWarnings ()
	{
		$keystore = Interspire_KeyStore::instance();
		$time = (int)$keystore->get('google_ps:auto:last:time');

		if ((int)Interspire_Request::post('time') != $time) {
			// only clear the warnings if the provided time matches the last run time, this prevents clearing warnings
			// that the user hasn't seen yet
			return;
		}

		$keystore->multiDelete('google_ps:auto:last:*');
	}

	public function handleIsCategoryAssigned()
	{
		$googlePs = new ISC_ADMIN_GOOGLEPS();
		$result = $googlePs->getGooglePsCategory((int)Interspire_Request::post('categoryId'));
		if (!empty ($result)) {
			$result = 1;
		} else {
			$result = 0;
		}
		$output = array(
			 'result' => $result,
		);
		ISC_JSON::output('', true, $output);
	}

	public function handleSaveGooglePsCategory()
	{
		$bcCatId = (int)Interspire_Request::post('bcCatId');
		$googlePsCatId = (int)Interspire_Request::post('googlePsCatId');

		$googlePs = new ISC_ADMIN_GOOGLEPS();

		$googlePs->delete($bcCatId);
		$googlePs->save($googlePsCatId, $bcCatId);

		ISC_JSON::output('', true);
	}

	public function handleUpdateGoogleTaxonomyMapping()
	{
		$oldTaxonomy = Interspire_Request::post('oldTaxonomy');
		$newTaxonomy = Interspire_Request::post('newTaxonomy');

		$googlePs = new GooglePs();
		$googlePs->UpdateGoogleTaxonomyMapping($oldTaxonomy, $newTaxonomy);

		ISC_JSON::output('', true);
	}

	public function handleGetInvalidGoogleCategoryMapping()
	{
		$outputCategories = array();

		$googlePs = new GooglePs();
		$outputCategories = $googlePs->getInvalidGoogleCategoriesMapping();
		ISC_JSON::output($outputCategories, true);
	}
}
