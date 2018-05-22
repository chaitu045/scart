<?php

/**
 * Upgrade class for 6.1.6
 * This class runs a series of methods used to upgrade the store to a specific version
 *
 * @package ISC
 * @subpackage ISC_Upgrade
 */
class ISC_ADMIN_UPGRADE_6106 extends ISC_ADMIN_UPGRADE_BASE
{
	public $steps = array(
		'clearEbayNotificationInKeystore',
	);

	/**
	* clear the ebay's notification on dashboard.
	*/
	public function clearEbayNotificationInKeystore()
	{
		$queryString = 'ebay:list_products:*';
		$keys = new Interspire_KeyStore;
		$keys->multiDelete($queryString);
		return true;
	}
}
