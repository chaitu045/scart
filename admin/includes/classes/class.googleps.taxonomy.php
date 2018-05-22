<?php

class ISC_ADMIN_GOOGLEPS_TAXONOMY
{

	/**
	 * Returns a list of countries and codes usable by Google Product Search
	 *
	 * @return array
	 */
	public static function getCountries()
	{
		$countries = array();
		$query = "
			SELECT countryiso2, countryname
			FROM [|PREFIX|]countries
			WHERE countryiso2 in ('AU', 'FR', 'DE', 'JP', 'GB', 'US', 'CN', 'IT', 'NL', 'ES')
			ORDER BY countryname
			";

		$result = $GLOBALS['ISC_CLASS_DB']->Query($query);
		while ($row = $GLOBALS['ISC_CLASS_DB']->Fetch($result)) {
			$countries[$row['countryiso2']] = $row['countryname'];
		}

		return $countries;
	}

	public static function searchProductByPathString($googlePsCategoryId = 0, $pathString = '')
	{
		$query = "
			SELECT COUNT(gpsc.id)
			FROM
				[|PREFIX|]google_ps_categories gpsc
			WHERE
				gpsc.path LIKE '". $GLOBALS['ISC_CLASS_DB']->Quote($pathString) ."%'
				AND
				gpsc.google_ps_category_id = ".(int)$googlePsCategoryId;
		$result = (bool)$GLOBALS['ISC_CLASS_DB']->FetchOne($query);
		return $result;
	}

	public static function getParentCategories($id)
	{
		$db = $GLOBALS['ISC_CLASS_DB'];
		$parentids = array();

		do
		{
			$query = '
				SELECT
					parent_id
				FROM
					[|PREFIX|]google_ps_categories
				WHERE
					flag = 1 AND
					id = '.(int)$id;

			$id = $db->FetchOne($query);
			$parentids[] = $id;
		} while($id);

		return $parentids;
	}

	/**
	 * Returns an array of sub categories for a given
	 * parent category id.
	 *
	 * @param integer category id
	 */
	public static function getSubcategories($id)
	{
		$db = $GLOBALS['ISC_CLASS_DB'];

		$query = '
			SELECT
				*
			FROM
				[|PREFIX|]google_ps_categories
			WHERE
				parent_id = '.(int)$id.' AND
				flag = 1
			ORDER BY
				name';

		if(!($result = $db->Query($query))) {
			return false;
		}

		$children = array();

		while($row = $db->Fetch($result)) {
			$children[] = $row;
		}

		return $children;
	}
}