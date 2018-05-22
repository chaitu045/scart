<?php

class ISC_ADMIN_GOOGLEPS_RULES extends ISC_ADMIN_BASE
{
	private $gtin = null;
	private $brand = null;
	private $mpn = null;
	private $gender = null;
	private $ageGroup = null;
	private $color = null;
	private $size = null;
	private $material = null;
	private $pattern = null;
	private $itemGroupId = null;
	private $googlePsCategoryMap = null;
	private $countryCode = null;

	private $basicFieldMap = array(
		 'gtin' => 'gtin',
		 'brand' => 'brand',
		 'mpn' => 'mpn',
		 'gender' => 'gender',
		 'ageGroup' => 'ageGroup',
		 'color' => 'color',
		 'size' => 'size',
		 'material' => 'material',
		 'pattern' => 'pattern',
		 'itemGroupId' => 'itemGroupId',
	);

	private $extendedFieldMap = array(
		 'price' => 'price',
	);

	private $fieldMap = null;

	private $includeExtendedFields = false;

	private $categoryId = 0;

	public function __construct($categoryId, $countryCode, $includeExtendedFields = false)
	{
		parent::__construct();
		$this->includeExtendedFields = $includeExtendedFields;
		$this->categoryId = $categoryId;
		$this->countryCode = $countryCode;

		$this->fieldMap = $this->basicFieldMap;
		if ($this->includeExtendedFields) {
			$this->fieldMap = array_merge($this->basicFieldMap, $this->extendedFieldMap);
		}

		$this->applyRules();
	}

	public function applyRules()
	{

		// Get the country code and google product category
		$googlePsCategory = GetClass('ISC_ADMIN_GOOGLEPS');
		$googlePsCategoryRow = $googlePsCategory->getGooglePsCategory($this->categoryId);

		if (!$googlePsCategoryRow) {
			$this->googlePsCategoryMap['required'];
			return false;
		}

		$googlePsCountry = $this->countryCode;
		$googlePsCategoryId = $googlePsCategoryRow['google_ps_category_id'];

		// Check for category's categorized.
		$isApperalProd = ISC_ADMIN_GOOGLEPS_TAXONOMY::searchProductByPathString($googlePsCategoryId, 'Apparel & Accessories');
		$isClothingProd = ISC_ADMIN_GOOGLEPS_TAXONOMY::searchProductByPathString($googlePsCategoryId, 'Apparel & Accessories > Clothing');
		$isShoesProd = ISC_ADMIN_GOOGLEPS_TAXONOMY::searchProductByPathString($googlePsCategoryId, 'Apparel & Accessories > Shoes');

		// Need to have country set
		if (empty ($googlePsCountry)) {
			return false;
		}
		// Do we require gender?
		if ($this->isGenderRequired($isApperalProd, $googlePsCountry)) {
			$this->gender['required'] = true;
		}

		// Do we require color?
		if ($this->isColorRequired($isApperalProd, $googlePsCountry)) {
			$this->color['required'] = true;
		}

		// Do we require age group?
		if ($this->isAgeGroupRequired($isApperalProd, $googlePsCountry)) {
			$this->ageGroup['required'] = true;
		}

		// Do we require size?
		if ($this->isSizeRequired($isClothingProd, $isShoesProd, $googlePsCountry)) {
			$this->size['required'] = true;
		}
		return true;
	}

	public function getRequiredFields()
	{
		$requiredFields = array();
		foreach($this->fieldMap as $localKey=>$paramKey) {
			$localVar = $this->$localKey;
			if (!empty ($localVar['required'])) {
				$requiredFields[] = $paramKey;
			}
		}
		return $requiredFields;
	}

	public function validateRules($fields)
	{
		if (!empty ($this->googlePsCategoryMap['required'])) {
			return $invalidFields['googlePsCategoryMap'] = true;
		}

		$invalidFields = array();
		foreach($this->fieldMap as $localKey=>$paramKey) {
			$localVar = $this->$localKey;
			if (!empty ($localVar['required']) && empty ($fields[$paramKey])) {
				$invalidFields[$paramKey] = true;
			}
		}
		return $invalidFields;
	}

	private function isGenderRequired($isApperalProd, $googlePsCountry)
	{
		if (isc_strtolower($googlePsCountry) == 'us' && $isApperalProd) {
			return true;
		}
		return false;
	}

	private function isSizeRequired($isClothingProd, $isShoesProd, $googlePsCountry)
	{
		if ($isClothingProd && $isShoesProd && isc_strtolower($googlePsCountry) == 'us') {
			return true;
		}
		return false;
	}

	private function isColorRequired($isApperalProd, $googlePsCountry)
	{
		if (isc_strtolower($googlePsCountry) == 'us' && $isApperalProd) {
			return true;
		}
		return false;
	}

	private function isAgeGroupRequired($isApperalProd, $googlePsCountry)
	{
		if (isc_strtolower($googlePsCountry) == 'us' && $isApperalProd) {
			return true;
		}
		return false;
	}
}