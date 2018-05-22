<?php

class ISC_SITEMAP_ROOT extends ISC_SITEMAP_NODE implements iISC_SITEMAP_NODE {

	/**
	*
	* @return string
	*/
	public function generateNodeHtml(ISC_SITEMAP_NODE_GENERATEHTMLOPTIONS $options = null)
	{
		if ($options === null) {
			$options = new ISC_SITEMAP_NODE_GENERATEHTMLOPTIONS;
		}

		$html = '';

		if ($this->countChildren()) {
			$html .= '<ul class="' . $options->rootClassName . '">';

			foreach ($this->getChildren() as $child) {
				$html .= $child->generateNodeHtml($options);
			}

			$html .= '</ul>';
		}

		return $html;
	}
}
