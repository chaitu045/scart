<?php

/**
 * Upgrade class for 6.1.4
 * This class runs a series of methods used to upgrade the store to a specific version
 *
 * @package ISC
 * @subpackage ISC_Upgrade
 */
class ISC_ADMIN_UPGRADE_6104 extends ISC_ADMIN_UPGRADE_BASE
{
	public $steps = array(
		'addSessionLastUpdatedIndex',
		'convertSessionsEngineToInnoDB',
		'addProductVariationCombinationVclowstockIndex',
		'addInventoryReturnedFlag',
	);

	/**
	* Convert sessions table to InnoDB
	*/
	public function convertSessionsEngineToInnoDB()
	{
		return $this->convertTableEngineStep('sessions', 'InnoDB');
	}

	/**
	* Add index on sessions.sesslastupdated
	*/
	public function addSessionLastUpdatedIndex ()
	{
		return $this->addIndexStep('sessions', 'sesslastupdated');
	}

	/**
	* Add index on product_variation_combinations.vclowstock
	*/
	public function addProductVariationCombinationVclowstockIndex()
	{
		return $this->addIndexStep(
			'product_variation_combinations',
			'vclowstock',
			'i_product_variation_combinations_vclowstock'
		);
	}

	/**
	* Adds the inventory_returned flag to the returns table
	*
	*/
	public function addInventoryReturnedFlag()
	{
		if (!$this->ColumnExists('[|PREFIX|]returns', 'inventory_returned')) {
			$query = "ALTER TABLE `[|PREFIX|]returns` ADD `inventory_returned` TINYINT(1) NOT NULL DEFAULT '0'";
			if (!$GLOBALS["ISC_CLASS_DB"]->Query($query)) {
				$this->SetError($GLOBALS["ISC_CLASS_DB"]->GetErrorMsg());
				return false;
			}
		}

		return true;
	}
}
