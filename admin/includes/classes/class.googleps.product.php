<?php

class ISC_ADMIN_GOOGLEPS_PRODUCT extends ISC_ADMIN_BASE {

	public function __construct()
	{
		parent::__construct();
	}

	public function loadByProductId($productId=0)
	{
		$query = "SELECT * FROM [|PREFIX|]google_ps_field_mappings WHERE productid='" . (int)$productId . "'";
		$result = $GLOBALS['ISC_CLASS_DB']->Query($query);
		$gpsFieldMappingRow = $GLOBALS['ISC_CLASS_DB']->Fetch($result);
		return $gpsFieldMappingRow;
	}

	public function save($gpsMappingData)
	{
		if(!is_array($gpsMappingData) || !isset($gpsMappingData['productid'])) {
			return false;
		}

		/**
		 * If there is an existing record, perform an UPDATE otherwise and INSERT
		 */
		$countQuery = 'SELECT * FROM [|PREFIX|]google_ps_field_mappings WHERE productid = '.(int)$gpsMappingData['productid'];
		$result = $GLOBALS['ISC_CLASS_DB']->Query($countQuery);
		if ($GLOBALS["ISC_CLASS_DB"]->CountResult($result) > 0) {
			$result = $GLOBALS['ISC_CLASS_DB']->UpdateQuery('google_ps_field_mappings', $gpsMappingData, 'productid='.$gpsMappingData['productid']);
		} else {
			$result = $GLOBALS['ISC_CLASS_DB']->InsertQuery('google_ps_field_mappings', $gpsMappingData);
		}

		return $result;
	}

	public function delete($productId)
	{
		$query = "DELETE FROM [|PREFIX|]google_ps_field_mappings
					WHERE productid = '".(int)$productId."'
					";
		$GLOBALS['ISC_CLASS_DB']->Query($query);
	}

	public static function getAvailGenders()
	{
		$availableGenders = array(
			 '0' => GetLang('ChooseAGender'),
			 isc_strtolower(GetLang('Male')) => GetLang('Male'),
			 isc_strtolower(GetLang('Female')) => GetLang('Female'),
			 isc_strtolower(GetLang('Unisex')) => GetLang('Unisex'),
		);
		return $availableGenders;
	}

	public static function getAvailAgeGroups()
	{
		$availableAgeGroup = array(
			 '0' => GetLang('ChooseAnAgeGroup'),
			 isc_strtolower(GetLang('Adult')) => GetLang('Adult'),
			 isc_strtolower(GetLang('Kids')) => GetLang('Kids'),
		);
		return $availableAgeGroup;
	}
}