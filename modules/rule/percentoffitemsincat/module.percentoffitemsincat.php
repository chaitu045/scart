<?php

class RULE_PERCENTOFFITEMSINCAT extends ISC_RULE
{
	private $amount;
	private $catids;
	protected $vendorSupport = true;

	public function __Construct($amount=0, $catids=array())
	{
		parent::__construct();

		$this->amount = $amount;
		$this->catids = $catids;

		$this->setName('PERCENTOFFITEMSINCAT');
		$this->displayName = GetLang($this->getName().'displayName');

		$this->addJavascriptValidation('amount', 'int', 0, 100);
		$this->addJavascriptValidation('catids', 'array');

		$this->addActionType('itemdiscount');
		$this->ruleType = 'Product';
	}

	public function initialize($data)
	{
		parent::initialize($data);

		$tmp = unserialize($data['configdata']);

		$this->amount = $tmp['var_amount'];


		$catIds = array(0);

		if (isset($tmp['var_catids'])) {
			$catIds = explode(',', $tmp['var_catids']);

			// does the set of categories contain the 'All Categories' option (id: 0) then we only need that
			if (in_array(0, $catIds)) {
				$catIds = array(0);
			}
		}

		$this->catids = $catIds;
	}

	public function initializeAdmin()
	{
		// add the admin template folder to the set of paths so we can load the category macro
		$loader = $this->getTemplateClass()->getLoader();
		$paths = $loader->getPaths();
		$paths[] = ISC_BASE_PATH . '/admin/templates';
		$loader->setPaths($paths);

		$selectedCategories = $this->catids;

		$GLOBALS['CategoryOptions'] = ISC_ADMIN_CATEGORY::getJSTreeCategoryData($selectedCategories, 0, GetLang('AllCategories'));

		$catString = "category-" . implode("', 'category-", $selectedCategories);
		$GLOBALS['selectedCategories'] = $catString;
	}

	public function resetState(ISC_QUOTE $quote)
	{
		$quote->addDiscount($this->getDbId(), 0);

		// Remove the discount amounts for this rule from all products
		foreach($quote->getItems() as $item) {
			$item->addDiscount($this->getDbId(), 0);
		}
	}

	public function applyRule(ISC_QUOTE $quote)
	{
		$found = false;
		$items = $quote->getItems();
		$ruleCats = $this->catids;

		// The discount needs to come off each item, so that tax is also affected.
		$totalDiscount = 0;
		foreach($items as $item) {
			$apply = false;
			if($item instanceof ISC_QUOTE_ITEM_GIFTCERTIFICATE) {
				continue;
			}

			$categoryIds = $item->getCategoryIds();
			foreach($ruleCats as $categoryId) {
				if(!in_array($categoryId, $categoryIds) && $categoryId != 0) {
					continue;
				}

				// if we have the 'All Categories' option, then just pick the first category the item is in
				if ($categoryId == 0){
					$categoryId = current($categoryIds);
				}

				$apply = true;
				$found[] = $categoryId;
			}

			if(!$apply) {
				continue;
			}

			$discountAmount = $item->getBaseTotal() * ($this->amount / 100);
			$discountAmount = round($discountAmount, getConfig('DecimalPlaces'));
			if($item->getBaseTotal() - $discountAmount < 0) {
				$discountAmount = 0;
			}

			$item->addDiscount($this->getDbId(), $discountAmount);
			$totalDiscount += $discountAmount;
		}

		if (!empty($found)) {

			$quote->addDiscount($this->getDbId(), $totalDiscount);

			$catname = '';
			$catids = implode(',', $found);

			$query = "
				SELECT catname
				FROM [|PREFIX|]categories
				WHERE categoryid IN ($catids)
			";
			$result = $GLOBALS['ISC_CLASS_DB']->Query($query);
			while($var = $GLOBALS['ISC_CLASS_DB']->Fetch($result)) {
				$catname[] = $var['catname'];
			}
			if (isset($catname{1})) {
				$this->banners[] = sprintf(GetLang($this->getName().'DiscountMessagePlural'), $this->amount, implode(' and ',$catname));
			} else {
				$this->banners[] = sprintf(GetLang($this->getName().'DiscountMessage'), $this->amount, implode(' and ',$catname));

			}
			return true;
		}

		return false;
	}

	public function haltReset(ISC_QUOTE $quote)
	{
		return false;
	}
}