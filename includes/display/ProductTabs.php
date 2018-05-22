<?php

	CLASS ISC_PRODUCTTABS_PANEL extends PANEL
	{
		public function SetPanelSettings()
		{
			if(GetConfig('EnableProductTabs') == 0) {
				$GLOBALS['HideSectionSeparator'] = '';
				$this->DontDisplay = true;
				return;
			}
			$GLOBALS['HideSectionSeparator'] = 'display:none;';

			if($script = $this->getCurrentTabJS()) {
				$GLOBALS['ISC_CLASS_TEMPLATE']->clientScript->registerScript($script,'end');
			}
		}

		protected function getCurrentTabJS()
		{
			if(GetConfig('EnableProductTabs') == 0 || empty($_REQUEST['tab'])) {
				return false;
			}

	        $tabId = $_REQUEST['tab'].'_Tab';
	        return 'CurrentProdTab = '.json_encode($tabId).';';
		}
	}