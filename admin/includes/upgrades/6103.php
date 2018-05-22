<?php

/**
 * Upgrade class for 6.1.3
 * This class runs a series of methods used to upgrade the store to a specific version
 *
 * @package ISC
 * @subpackage ISC_Upgrade
 */
class ISC_ADMIN_UPGRADE_6103 extends ISC_ADMIN_UPGRADE_BASE
{
	public $steps = array(
		'addOrderShippingOrderIdIndex',
		'changeProductTagAssociationsPrimaryKey',
		'addProductTagAssociationsProductIdIndex',
		'addProductTagsTagNameIndex',
		'addProductTagsTagFriendlyNameIndex',
		'addProductTaxClassToBulkEditTemplate',
		'addCustomersCustConEmailIndex',
		'addCustomersDiscountDiscountTypeIndex',
		'addUniqueVisitorsDatestampIndex',
		'changeOrdersShippingAddressCountDefault',
		'fixOrderShippingAddressCountForEbayOrders',
	);

	public function pre_upgrade_checks ()
	{
		// ISC-1826 look for and, if found, attempt to delete the emailchange addon
		if (is_dir(ISC_BASE_PATH . '/addons/emailchange')) {
			if (!@recursiveDeleteDirectory(ISC_BASE_PATH . '/addons/emailchange')) {
				// automatically deleting the directory failed - halt the upgrade with error message
				$this->SetError(GetLang('EmailChangeModulePreUpgradeCheck'));
				return false;
			}
		}
		return true;
	}

	/**
	* ISC-1634 Order XML exports reportedly take much longer after 6.0 and may occasionally fail
	*
	* Add a missing index on order_shipping.order_id
	*/
	public function addOrderShippingOrderIdIndex ()
	{
		if ($this->IndexExists('[|PREFIX|]order_shipping', 'order_id')) {
			return true;
		}

		$query = "ALTER TABLE [|PREFIX|]order_shipping ADD INDEX (`order_id`)";
		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}

		return true;
	}

	/**
	* ISC-174 Add indexes to the product_tags and product_tagassociations tables.
	*
	* Remove tagassocid and change the primary key of product_tagassociations to tagid + productid
	*/
	public function changeProductTagAssociationsPrimaryKey ()
	{
		if (!$this->ColumnExists('[|PREFIX|]product_tagassociations', 'tagassocid')) {
			return true;
		}

		$query = "
		ALTER IGNORE TABLE `[|PREFIX|]product_tagassociations`
		DROP COLUMN `tagassocid`,
		DROP PRIMARY KEY,
		ADD PRIMARY KEY (`tagid`, `productid`)
		";

		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}

		return true;
	}

	/**
	* ISC-174 Add indexes to the product_tags and product_tagassociations tables.
	*
	* Add a missing index on product_tagassociations.productid
	*/
	public function addProductTagAssociationsProductIdIndex ()
	{
		if ($this->IndexExists('[|PREFIX|]product_tagassociations', 'productid')) {
			return true;
		}

		$query = "ALTER TABLE [|PREFIX|]product_tagassociations ADD INDEX (`productid`)";
		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}

		return true;
	}

	/**
	* ISC-174 Add indexes to the product_tags and product_tagassociations tables.
	*
	* Add a missing index on product_tags.tagname
	*/
	public function addProductTagsTagNameIndex ()
	{
		if ($this->IndexExists('[|PREFIX|]product_tags', 'tagname')) {
			return true;
		}

		$query = "ALTER TABLE [|PREFIX|]product_tags ADD INDEX (`tagname`)";
		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}

		return true;
	}

	/**
	* ISC-174 Add indexes to the product_tags and product_tagassociations tables.
	*
	* Add a missing index on product_tags.tagfriendlyname
	*/
	public function addProductTagsTagFriendlyNameIndex ()
	{
		if ($this->IndexExists('[|PREFIX|]product_tags', 'tagfriendlyname')) {
			return true;
		}

		$query = "ALTER TABLE [|PREFIX|]product_tags ADD INDEX (`tagfriendlyname`)";
		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}

		return true;
	}

	public function addProductTaxClassToBulkEditTemplate()
	{
		$db = $GLOBALS['ISC_CLASS_DB'];

		// the field to create
		$field = array(
			'fieldid' => 'productTaxClass',
			'fieldtype' => 'products',
			'fieldname'	=> 'Product Tax Class',
			'includeinexport' => 1,
			'sortorder' => 72,
		);

		// get the template ID for the bulk edit template
		$query = "SELECT exporttemplateid FROM [|PREFIX|]export_templates WHERE exporttemplatename = 'Bulk Edit' AND builtin = 1";
		$res = $db->Query($query);
		$templateRow = $db->Fetch($res);
		if (!$templateRow) {
			return true;
		}

		$field['exporttemplateid'] = $templateRow['exporttemplateid'];

		// Get the bulk edit template id
		$query = "
			SELECT
				exporttemplatefieldid
			FROM
				[|PREFIX|]export_template_fields
			WHERE
				exporttemplateid = " . $field['exporttemplateid'] . " AND
				fieldid = '". $field['fieldid'] ."'
		";
		$result = $db->Query($query);

		// If the Product Tax Class field doesn't exist add it
		if (!$fieldRow = $db->Fetch($result)) {
			// bump sort orders to make room for the field
			$query = "
				UPDATE
					[|PREFIX|]export_template_fields
				SET
					sortorder = sortorder + 1
				WHERE
					exporttemplateid = ".$templateRow['exporttemplateid']."
					AND fieldtype = '".$field['fieldtype']."'
					AND sortorder >= ".$field['sortorder']."
			";

			if(!$db->Query($query)) {
				$this->SetError($db->GetErrorMsg());
				return false;
			}

			// create the field
			if(!$db->InsertQuery('export_template_fields', $field)) {
				$this->SetError($db->GetErrorMsg());
				return false;
			}
		}

		return true;
	}

	/**
	* ISC-1928 Adding Index tht customers table on custconemail
	*
	*/
	public function addCustomersCustConEmailIndex()
	{
		if ($this->IndexExists('[|PREFIX|]customers', 'custconemail')) {
			return true;
		}

		$query = "ALTER TABLE [|PREFIX|]customers ADD INDEX (`custconemail`)";
		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}

		return true;
	}

	public function addCustomersDiscountDiscountTypeIndex()
	{
		if ($this->IndexExists('[|PREFIX|]customer_group_discounts', 'discounttype')) {
			return true;
		}

		$query = "ALTER TABLE [|PREFIX|]customer_group_discounts ADD INDEX discounttype (discounttype, catorprodid, customergroupid)";
		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}
		return true;
	}

	public function addUniqueVisitorsDatestampIndex()
	{
		if ($this->IndexExists('[|PREFIX|]unique_visitors', 'unique_datestamp')) {
			return true;
		}

		$query = "ALTER IGNORE TABLE [|PREFIX|]unique_visitors ADD UNIQUE unique_datestamp (datestamp)";
		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}
		return true;
	}

	public function changeOrdersShippingAddressCountDefault ()
	{
		$query = "ALTER TABLE `[|PREFIX|]orders` MODIFY COLUMN `shipping_address_count` INT UNSIGNED NOT NULL DEFAULT 0";
		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}
		return true;
	}

	public function fixOrderShippingAddressCountForEbayOrders ()
	{
		$query = "UPDATE `[|PREFIX|]orders` SET shipping_address_count = 1 WHERE ebay_order_id > 0 AND shipping_address_count = 0";
		if (!$this->db->Query($query)) {
			$this->SetError($this->db->GetErrorMsg());
			return false;
		}
		return true;
	}
}
