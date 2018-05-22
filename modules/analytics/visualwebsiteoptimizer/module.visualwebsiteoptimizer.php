<?php

	/**
	* This is the Visual Website Optimizer module for Interspire Shopping Cart. To enable
	* this module in Interspire Shopping Cart login to the control panel and click the
	* Settings -> Analytics Settings tab in the menu.
	*/
	class ANALYTICS_VISUALWEBSITEOPTIMIZER extends ISC_ANALYTICS
	{

		/*
			Analytics class constructor
		*/
		public function __construct()
		{
			// Setup the required variables for the Visual Website Optimizer module
			parent::__construct();

			$goalURL = getConfig('ShopPathSSL') . '/finishorder.php*';

			$this->_name = GetLang('VisualWebsiteOptimizerName');
			$this->_image = "logo.png";
			$this->_description = GetLang('VisualWebsiteOptimizerDesc');
			$this->_help = sprintf(GetLang('VisualWebsiteOptimizerHelp'), $GLOBALS['ShopPath'], $goalURL);
			$this->_height = 0;
		}

		/**
		* Custom variables for the Visual Website Optimizer module. Custom variables are stored in the following format:
		* array(variable_id, variable_name, variable_type, help_text, default_value, required, [variable_options], [multi_select], [multi_select_height])
		* variable_type types are: text,number,password,radio,dropdown
		* variable_options is used when the variable type is radio or dropdown and is a name/value array.
		*/
		public function SetCustomVars()
		{
			$this->_variables['trackingcode'] = array(
				"name" => "Tracking Code",
				"type" => "textarea",
				"help" => GetLang('VisualWebsiteOptimizerTrackingCodeHelp'),
				"default" => "",
				"required" => true,
				"rows" => 7
			);
		}
	}
