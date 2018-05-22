<?php

class Store_ExportTemplateHelper
{

	static protected $initialised = false;
	static protected $dbHandler;
	static protected $error;
	static public $debug = false;

	private function init()
	{

		if(!self::$initialised) {
			self::$dbHandler = $GLOBALS["ISC_CLASS_DB"];
			self::$initialised = true;
		}

	}

	/**
	* Helper function to Lookup the ID of the export template by name.
	* @param String $templateName
	*/
	public static function getExportTempateId($templateName)
	{

		self::init(); // Make sure we have a db handler

		$query = "SELECT exporttemplateid FROM [|PREFIX|]export_templates WHERE exporttemplatename = '".self::$dbHandler->Quote($templateName)."' AND builtin = 1";
		if(self::$debug) {
			echo $query."\n";
		}

		$exportTemplateId = self::$dbHandler->FetchOne($query);
		if (!$exportTemplateId) {
			self::$error = self::$dbHandler->GetErrorMsg();
			return false;
		}
		return $exportTemplateId;
	}

	/**
	 * Update the sort order for fields higher than the id supplied.
	 * @param Integer $exportTemplateFieldId
	 * @param Integer $exportTemplateId
	 * @param String $fieldType
	 * @param Integer $sortOrder
	 */
	private static function incrementSortOrderFrom($exportTemplateFieldId, $exportTemplateId, $fieldType, $sortOrder)
	{

		$query = "UPDATE [|PREFIX|]export_template_fields SET sortorder = sortorder + 1
		WHERE
		exporttemplateid = $exportTemplateId AND
		fieldtype = '$fieldType' AND
		( sortorder >= $sortOrder AND exporttemplatefieldid != $exportTemplateFieldId )";

		if(self::$debug) {
			echo $query."\n";
		}

		$result = self::$dbHandler->Query($query);

		if (!$result) {
			self::$error = self::$dbHandler->GetErrorMsg();
			return false; // Perhaps this should be a soft fail?
		}

		return true;

	}

	/**
	* Enter description here ...
	*
	* $fieldData as follows:
	* -- fieldid
	* -- fieldtype
	* -- fieldname
	* -- includeinexport
	* -- sortorder
	*
	* @param Integer $templateId The template
	* @param Array $fieldData include keys:
	* @param Integer $incrementSortOrder
	*/
	public static function addExportTemplateField($templateId, $fieldData, $incrementSortOrder=true)
	{

		self::init(); // Make sure we have a db handler

		/**
		 * @todo Validate the $fieldData
		 */
		if(!self::validateFieldData($fieldData)) {
			self::$error = 'Could not validate $fieldData';
			return false;
		}

		// Lets check if the 'itemType' field exists, this should indicate if we've processed this step before
		$query = "SELECT COUNT(*) FROM [|PREFIX|]export_template_fields WHERE fieldid = '".self::$dbHandler->Quote($fieldData['fieldid'])."' AND exporttemplateid = " . self::$dbHandler->Quote($templateId);
		if(self::$debug) {
			echo $query."\n";
		}

		// Field already present.
		if (self::$dbHandler->FetchOne($query) > 0) {
			return true;
		}

		// Create an array to use with the InsertQuery.
		$insert = array_merge($fieldData, array('exporttemplateid'=>$templateId));

		// Perform the insert.
		$fieldId = self::$dbHandler->InsertQuery('export_template_fields', $insert);

		if(self::$debug) {
			echo 'New tempalte $fieldId: '.$fieldId."\n";
		}

		if (!$fieldId) {
			self::$error = self::$dbHandler->GetErrorMsg();
			return false;
		}

		// Increment all the following fields sort order.
		if($incrementSortOrder) {

			// $exportTemplateFieldId, $exportTemplateId, $fieldType, $sortOrder

			if(!self::incrementSortOrderFrom($fieldId, $templateId, $fieldData['fieldtype'], $fieldData['sortorder'])) {
				return true;
			}
		}

		return true;

	}

	/**
	 * @todo complete validation.
	 * @param Array $fieldData
	 */
	private static function validateFieldData($fieldData)
	{
		return true;
	}

	/**
	 * Helper method used when generating PHP to past into the import code.
	 * @param String $str
	 * @return String
	 */
	public static function fromCamelCase($str)
	{
		$str[0] = strtolower($str[0]);
		$func = create_function('$c', 'return "_" . strtolower($c[1]);');
		return preg_replace_callback('/([A-Z])/', $func, $str);
	}

}
