<?php
require_once "class.ajaxexporter.php";
require_once ISC_BASE_PATH.'/lib/api/category.api.php';

class ISC_ADMIN_FROOGLE extends ISC_ADMIN_AJAXEXPORTER
{
	public $countryCode = '';
	public $descriptiveExportName = '';

	public function __construct()
	{
		$GLOBALS['ISC_CLASS_ADMIN_ENGINE']->LoadLangFile('froogle');

		$this->exportName = GetLang('FroogleFeed');
		$this->className = 'Froogle';
		$this->displayAutoExport = true;
		$this->exportIcon = 'froogle.gif';

		$GLOBALS['ExportName'] = GetLang('FroogleFeed');
		$GLOBALS['ExportIntro'] = GetLang('FroogleFeedIntro');
		$GLOBALS['ExportGenerate'] = GetLang('GenerateFroogleFeed');
		$GLOBALS['ExportDetailsInfo'] = GetLang('GpsExportDetailsInfo');
		$this->descriptiveExportName = GetLang('DescriptiveProduct');

		parent::__construct();

		$this->template->assign('countries', ISC_ADMIN_GOOGLEPS_TAXONOMY::getCountries());
	}

	protected function _getExportUrl ($user)
	{
		// :country_code is intended to be replaced dynamically in the UI by the targetted country
		return parent::_getExportUrl($user) . '&cc=:country_code';
	}

	protected function _getTemplate ()
	{
		return 'googleps.export.tpl';
	}

	/**
	 * This is used in the ajaxexporter->Export() method to write the initial file handle.
	 */
	protected function GetExportFileName()
	{
		return "GoogleBaseFeed-".isc_date("Y-m-d").'.xml';
	}

	protected function GetResultCount()
	{
		if (isset($_REQUEST['cc'])) {
			$this->countryCode = $_REQUEST['cc'];
		}

		$query = "
			SELECT
				COUNT(p.productid) as count
			FROM
				[|PREFIX|]products p
			WHERE
				p.prodvisible=1
				and p.google_ps_enabled=1
				and p.proddesc <> ''
		";

		$result = $GLOBALS['ISC_CLASS_DB']->Query($query);
		$count = $GLOBALS['ISC_CLASS_DB']->FetchOne($result);

		return $count;
	}

	protected function WriteHeader()
	{
		$exportDate = isc_date("Y-m-d\TH:i:s\Z", time());
		$header = '<?xml version="1.0" encoding="' . GetConfig('CharacterSet') . '"?>
		<feed xmlns="http://www.w3.org/2005/Atom" xmlns:g="http://base.google.com/ns/1.0">
			<title>' . isc_html_escape($GLOBALS['StoreName']) . '</title>
			<link rel="self" href="'.str_replace("https://", "http://",$GLOBALS['ShopPath']).'"/>
			<updated>'.$exportDate.'</updated>
			<author>
				<name>' . isc_html_escape($GLOBALS['StoreName']) . '</name>
			</author>
			<id>tag:'.time().'</id>
		';

		fwrite($this->handle, $header);
	}

	protected function WriteFooter()
	{
		fwrite($this->handle, '</feed>');
	}

	protected function GetResult($generateFull = false, $start = 0)
	{
		$query = "
			SELECT
				p.*,
				c.catname,
				pi.*,
				b.brandname

			FROM
				[|PREFIX|]products p

				/* Join categories */
				INNER JOIN (
					SELECT
						c.catname,
						c.categoryid,
						ca.productid
					FROM
						[|PREFIX|]categoryassociations ca,
						[|PREFIX|]categories c
					WHERE
						c.categoryid=ca.categoryid
					GROUP BY ca.productid
				) c ON (c.productid = p.productid)

				/* Join product thumb images */
				LEFT JOIN
					[|PREFIX|]product_images pi ON (pi.imageprodid = p.productid AND pi.imageisthumb = 1)

				/* Join brands */
				LEFT JOIN
					[|PREFIX|]brands b ON (b.brandid = p.prodbrandid)
			WHERE
				p.prodvisible=1
				and p.google_ps_enabled=1
				and p.proddesc <> ''
		";

		$query .= $GLOBALS['ISC_CLASS_DB']->AddLimit($start, $this->resultsPerPage);
		$result = $GLOBALS['ISC_CLASS_DB']->Query($query);

		return $result;
	}

	public function WriteRow($row)
	{
		// process the generator only if this product's GPS has been turned on.
		++$this->totalNum;

		$expirationDate = isc_date("Y-m-d", strtotime('+29 days'));

		// Data to be validated
		$dataForValidation = array();

		// Invalid data flag
		$invalidFeed = false;

		// Retrieve the data for the additional GPS data.
		$googlePsProduct = GetClass("ISC_ADMIN_GOOGLEPS_PRODUCT");
		$googlePsCategory = GetClass("ISC_ADMIN_GOOGLEPS");

		$googlePsProductData = $googlePsProduct->loadByProductId($row['productid']);
		if (!empty ($googlePsProductData)) {
			if (!empty ($googlePsProductData['categoryid'])) {

				$googlePsCategoryData = $googlePsCategory->getGooglePsCategory($googlePsProductData['categoryid']);
				if (!$googlePsCategoryData) {
					++$this->failureNum;
					return false;
				}
				$googlePsRules = new ISC_ADMIN_GOOGLEPS_RULES($googlePsProductData['categoryid'], $this->countryCode);
			}
		}

		$link = ProdLink($row['prodname']);
		$desc = strip_tags($row['proddesc']);
		// Strip out invalid characters
		$desc = StripInvalidXMLChars($desc);

		if(isc_strlen($desc) > 1000) {
			$desc = isc_substr($desc, 0, 997)."...";
		}

		// Get the product type
		$catApi = new API_CATEGORY();
		$subCats = current($catApi->getProductCatsTree($row['productid']));

		$xmlProductType = '';
		if (!empty ($subCats)) {
			$tempGeneratedPaths = array();
			foreach ($subCats as $key=>$value) {
				$tempGeneratedPath[] = trim($value['catname']);
			}
			$xmlProductType = implode(" > ", $tempGeneratedPath);
		}

		$entry = array(
			'title' => isc_html_escape($row['prodname']),
			'link' => isc_html_escape($link),
			'description' => isc_html_escape($desc),
			'g:expiration_date' => $expirationDate,
			'g:id' => $row['productid'],
			'g:condition' => isc_html_escape(isc_strtolower($row['prodcondition'])),
		);

		if (!empty ($xmlProductType)) {
			$entry['g:product_type'] = isc_html_escape($xmlProductType);
		}

		if($row['brandname']) {
			$entry['g:brand'] = isc_html_escape($row['brandname']);
			$dataForValidation['brand'] = isc_html_escape($row['brandname']);
		}

		if(!empty($row['imagefile'])) {
			try {
				$image = new ISC_PRODUCT_IMAGE();
				$image->populateFromDatabaseRow($row);
				$entry['g:image_link'] = isc_html_escape($image->getResizedUrl(ISC_PRODUCT_IMAGE_SIZE_ZOOM, true, true, false));
				}
			catch (Exception $ex) {
			}
		}

		// retired field, however, we can leave and google will just ignore it.
		if($row['prodcode']) {
			$entry['g:model_number'] = isc_html_escape($row['prodcode']);
		}

		if($row['prodweight'] > 0) {
			if(GetConfig('WeightMeasurement') == 'KGS') {
				$measure = 'kg';
			}
			else {
				$measure = strtolower(GetConfig('WeightMeasurement'));
			}
			$entry['g:shipping_weight'] = FormatWeight($row['prodweight'], false).' '.$measure;
		}

		// retired field, however, we can leave and google will just ignore it.
		$dimensions = array(
			'g:height' => 'prodheight',
			'g:length' => 'proddepth',
			'g:width' => 'prodwidth'
		);
		if(GetConfig('LengthMeasurement') == 'Centimeters') {
			$measure = 'cm';
		}
		else {
			$measure = strtolower(GetConfig('LengthMeasurement'));
		}

		foreach($dimensions as $google => $ours) {
			if($row[$ours] > 0) {
				$entry[$google] = $row[$ours].' '.$measure;
			}
		}

		// process the additional google product search data.
		// if we have this category assigned to GPS category
		if (!empty ($googlePsCategoryData)) {

			// GPS Category
			if (!empty ($googlePsCategoryData['full_path'])) {
				$entry['g:google_product_category'] = isc_html_escape($googlePsCategoryData['full_path']);
			}

			// gtin
			if (!empty ($googlePsProductData['global_trade_item_number'])) {
				$entry['g:gtin'] = isc_html_escape($googlePsProductData['global_trade_item_number']);
				$dataForValidation['gtin'] = isc_html_escape($googlePsProductData['global_trade_item_number']);
			} elseif (empty($googlePsProductData['global_trade_item_number']) && !empty($row['upc'])) {
				$entry['g:gtin'] = isc_html_escape($row['upc']);
				$dataForValidation['gtin'] = isc_html_escape($row['upc']);
			}

			// mpn
			if (!empty ($googlePsProductData['manufacturer_part_number'])) {
				$entry['g:mpn'] = isc_html_escape($googlePsProductData['manufacturer_part_number']);
				$dataForValidation['mpn'] = isc_html_escape($googlePsProductData['manufacturer_part_number']);
			}

			// gender
			if (!empty ($googlePsProductData['gender'])) {
				$entry['g:gender'] = isc_html_escape($googlePsProductData['gender']);
				$dataForValidation['gender'] = isc_html_escape($googlePsProductData['gender']);
			}

			// age group
			if (!empty ($googlePsProductData['age_group'])) {
				$entry['g:age_group'] = isc_html_escape($googlePsProductData['age_group']);
				$dataForValidation['ageGroup'] = isc_html_escape($googlePsProductData['age_group']);
			}

			// color
			if (!empty ($googlePsProductData['color'])) {
				$entry['g:color'] = isc_html_escape($googlePsProductData['color']);
				$dataForValidation['color'] = isc_html_escape($googlePsProductData['color']);
			}

			// size
			if (!empty ($googlePsProductData['size'])) {
				$entry['g:size'] = isc_html_escape($googlePsProductData['size']);
				$dataForValidation['size'] = isc_html_escape($googlePsProductData['size']);
			}

			// material
			if (!empty ($googlePsProductData['material'])) {
				$entry['g:material'] = isc_html_escape($googlePsProductData['material']);
				$dataForValidation['material'] = isc_html_escape($googlePsProductData['material']);
			}

			// pattern
			if (!empty ($googlePsProductData['pattern'])) {
				$entry['g:pattern'] = isc_html_escape($googlePsProductData['pattern']);
				$dataForValidation['pattern'] = isc_html_escape($googlePsProductData['pattern']);
			}

		}
		// no GPS category assigned
		else {
			$invalidFeed = true;
		}

		// validate the fields
		if (!$invalidFeed) {
			$invalidData = $googlePsRules->validateRules($dataForValidation);
			if (!empty ($invalidData)) {
				$invalidFeed = true;
			}
		}
		// determine the product availability
		$availability = 'in stock';
		if (!empty ($row['prodpreorder'])) {
			$availability = 'preorder';
		}
		elseif (empty ($row['prodallowpurchases'])) {
			$availability = 'available for order';
		}
		elseif (!empty ($row['prodinvtrack']) && $row['prodcurrentinv'] <= 0) {
			$availability = 'out of stock';
		}
		$entry['g:availability'] = isc_html_escape($availability);

		// For US: we do not include tax and include tax for all other countries
		$includeTax = true;
		if (!empty($this->countryCode) && isc_strtolower($this->countryCode) == "us") {
			$includeTax = false;
		}

		$currency = GetDefaultCurrency();
		$currencyCode = $currency['currencycode'];
		$price = getClass('ISC_TAX')->getPrice($row['prodcalculatedprice'], $row['tax_class_id'], $includeTax);
		$entry['g:price'] = $price . " " . $currencyCode;

		$xml = "<entry>\n";
		foreach($entry as $k => $v) {
			$xml .= "\t<".$k."><![CDATA[".$v."]]></".$k.">\n";
		}
		if(isset($row['prodfreeshipping']) && $row['prodfreeshipping'] != 1){
			$xml .= "</entry>\n";
		} else {
			$xml .= "\t<g:shipping><g:price><![CDATA[0]]></g:price></g:shipping>\n</entry>\n";
		}

		// if we have any invalid data, increment the failure count
		if ($invalidFeed) {
			++$this->failureNum;
		}
		// otherwise, write the data to file
		else {
			fwrite($this->handle, $xml);
		}
	}
}