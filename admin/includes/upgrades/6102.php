<?php

/**
 * Upgrade class for 6.1.2
 * This class runs a series of methods used to upgrade the store to a specific version
 *
 * @package ISC
 * @subpackage ISC_Upgrade
 */
class ISC_ADMIN_UPGRADE_6102 extends ISC_ADMIN_UPGRADE_BASE
{
	public $steps = array(
		'updateCouponsCouponMinPurchase',
	);

	/**
	* Update the column type of couponminpurchase to decimal.
	* This will allow the user to input decimal amount of minimum purchase
	*
	*/
	public function updateCouponsCouponMinPurchase()
	{
		if ($this->ColumnExists('[|PREFIX|]coupons', 'couponminpurchase')) {
			$query = "ALTER TABLE `[|PREFIX|]coupons` CHANGE `couponminpurchase` `couponminpurchase` DECIMAL(20,4) NOT NULL DEFAULT '0'";
			if (!$GLOBALS["ISC_CLASS_DB"]->Query($query)) {
				$this->SetError($GLOBALS["ISC_CLASS_DB"]->GetErrorMsg());
				return false;
			}
		}
		return true;
	}

}
