<?php

class Job_GooglePs_TaxonomiesSync extends Job_Store_Abstract
{
	public function perform()
	{
		$gps = new GooglePs();
		return $gps->processCategoriesSync();
	}
}
