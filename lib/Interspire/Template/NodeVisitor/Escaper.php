<?php

/**
* Twig's default Escaper extension makes use of Twig_NodeVisitor_SafeAnalysis which uses spl_object_hash; a PHP 5.2.4
* function. This extension overrides the default Twig behaviour to offer an alternative code block for use with PHP <
* 5.2.4 offering compatability at lower performance.
*/
class Interspire_Template_NodeVisitor_Escaper extends Twig_NodeVisitor_Escaper
{
	public function __construct()
	{
		parent::__construct();
		$this->safeAnalysis = new Interspire_Template_NodeVisitor_SafeAnalysis;
	}
}
