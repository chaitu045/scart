<?php

/**
* Twig's default Escaper extension makes use of Twig_NodeVisitor_SafeAnalysis which uses spl_object_hash; a PHP 5.2.4
* function. This extension overrides the default Twig behaviour to offer an alternative code block for use with PHP <
* 5.2.4 offering compatability at lower performance.
*/
class Interspire_Template_Extension_Escaper extends Twig_Extension_Escaper
{
	/**
	* Returns the node visitor instances to add to the existing list.
	*
	* @return array An array of Twig_NodeVisitorInterface instances
	*/
	public function getNodeVisitors()
	{
		return array(
			new Interspire_Template_NodeVisitor_Escaper,
		);
	}
}
