<?php

/**
 * Table Data Gateway/Repository for accessing mappings between Product Categories and
 * the Google Product Search taxonomy.
 *
 * It's procedural, with static methods for the time being, because there is no encapsulated state
 * -- it just delegates to the global database connection.
 *
 * @todo really should be called GooglePsCategoryMappings or something of the like
 * @todo encapsulate add/update actions in here too
 */
class ISC_ADMIN_GOOGLEPS_CATEGORIES
{

	/**
	 * Get a list of product categories mapped to the Google Product Search taxonomy.
	 *
	 * @return array
	 */
	public static function getMappings()
	{
		$mappings = array();

		$query = "SELECT google_ps_category_id,name,path,categoryid
				  FROM `[|PREFIX|]google_ps_categories` c,`[|PREFIX|]google_ps_category_associations` a
				  WHERE c.google_ps_category_id=a.google_ps_categories_id
				  AND flag=1";

		$result = $GLOBALS['ISC_CLASS_DB']->Query($query);
		while ($mapping = $GLOBALS['ISC_CLASS_DB']->Fetch($result)) {
			$mappings[$mapping['categoryid']] = $mapping;
		}

		return $mappings;
	}

}