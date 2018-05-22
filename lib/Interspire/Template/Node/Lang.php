<?php

class Interspire_Template_Node_Lang extends Twig_Node
{
	protected $name;

	protected $vars;

	public function __construct($name, $vars, $lineNo)
	{
		parent::__construct(array(), array(), $lineNo);

		$this->name = $name;
		$this->vars = $vars;
	}

	public function compile(Twig_Compiler $compiler)
	{
		$compiler
			->addDebugInfo($this)
			->write('echo getLang(')
			->subcompile($this->name)
		;

		if (!empty($this->vars)) {
			$compiler->raw(', ');
			$compiler->subcompile($this->vars);
		}

		$compiler->raw(");\n");
	}
}