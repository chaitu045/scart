<?php
class ISC_SIMILARPRODUCTSBYTAG_PANEL extends PANEL
{
	public function SetPanelSettings()
	{
		if($GLOBALS['ISC_CLASS_PRODUCT']->ProductHasTags() == false) {
			$this->DontDisplay = true;
			return false;
		}

		// Get the correct tag count associated with this product
		// There's a tagcount column which is updated occasionally; use that, even if it might be slightly out of date
		// saves a lot of db load

		$tags = array();
		$query = "
			SELECT
				pt.tagid,
				pt.tagname,
				pt.tagfriendlyname,
				pt.tagcount

			FROM
				[|PREFIX|]product_tagassociations pta,
				[|PREFIX|]product_tags pt

			WHERE
				pta.productid = " . (int)$GLOBALS['ISC_CLASS_PRODUCT']->GetProductId() . "
				AND pt.tagid = pta.tagid
				AND pt.tagcount > 1

			ORDER BY
				pt.tagname
		";

		$result = $GLOBALS['ISC_CLASS_DB']->Query($query);
		while($tag = $GLOBALS['ISC_CLASS_DB']->Fetch($result)) {
			$tags[] = $tag;
		}

		if(empty($tags)) {
			$this->DontDisplay = true;
			return false;
		}
		$tagCount = count($tags);

		$min = GetConfig('TagCloudMinSize');
		$max = GetConfig('TagCloudMaxSize');
		$GLOBALS['SNIPPETS']['TagList'] = '';
		foreach($tags as $tag) {
			$weight = ceil(($tag['tagcount']/$tagCount)*100);
			if ($weight > 100) {
				$weight = 100;
			}

			if($max > $min) {
				$fontSize = (($weight/100) * ($max - $min)) + $min;
			}
			else {
				$fontSize = (((100-$weight)/100) * ($max - $min)) + $max;
			}
			$fontSize = (int)$fontSize;
			$GLOBALS['FontSize'] = $fontSize.'%';
			$GLOBALS['TagName'] = isc_html_escape($tag['tagname']);
			$GLOBALS['TagLink'] = TagLink($tag['tagfriendlyname'], $tag['tagid']);
			$GLOBALS['TagProductCount'] = sprintf(GetLang('XProductsTaggedWith'), $tag['tagcount'], isc_html_escape($tag['tagname']));
			$GLOBALS['SNIPPETS']['TagList'] .= $GLOBALS['ISC_CLASS_TEMPLATE']->GetSnippet('SimilarProductsByTagTag');
		}
	}
}