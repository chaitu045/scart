<?php

/**
* Twig's default Escaper extension makes use of Twig_NodeVisitor_SafeAnalysis which uses spl_object_hash; a PHP 5.2.4
* function. This extension overrides the default Twig behaviour to offer an alternative code block for use with PHP <
* 5.2.4 offering compatability at lower performance.
*/
class Interspire_Template_NodeVisitor_SafeAnalysis extends Twig_NodeVisitor_SafeAnalysis
{
	public function getSafe(Twig_NodeInterface $node)
	{
		if (function_exists('spl_object_hash')) {
			return parent::getSafe($node);
		}

		// lower performance hack to make twig work with PHP < 5.2.4
		foreach ($this->data as $bucket) {
			if ($bucket['key'] === $node) {
				return $bucket['value'];
			}
		}
		return null;
	}

	protected function setSafe(Twig_NodeInterface $node, array $safe)
	{
		if (function_exists('spl_object_hash')) {
			return parent::setSafe($node, $safe);
		}

		// lower performance hack to make twig work with PHP < 5.2.4
		foreach ($this->data as &$bucket) {
			if ($bucket['key'] === $node) {
				$bucket['value'] = $safe;
				return;
			}
		}

		$this->data[] = array(
			'key' => $node,
			'value' => $safe,
		);
		return;
	}
}
