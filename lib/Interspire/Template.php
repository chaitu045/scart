<?php
class Interspire_Template extends Twig_Environment
{
	static private $instances = array();

	private $assignedVars = array();

	public function __construct($templatePaths, array $options = array())
	{
		if(!is_array($templatePaths)) {
			$templatePaths = array($templatePaths);
		}

		$options = array_merge(array(
			'auto_escape' => true,
		), $options);

		$options['debug'] = GetConfig('DebugMode');

		$loader = new Twig_Loader_Filesystem($templatePaths);
		parent::__construct($loader, $options);

		// override twig's escaper extension with ours
		$this->addExtension(new Interspire_Template_Extension_Escaper((bool)$options['auto_escape']));

		$this->addExtension(new Interspire_Template_Extension());
	}

	/**
	* Get a named instance of the template system (e.g. 'admin')
	*
	* @param string $instance
	* @param array|string $templatePaths
	* @param array $options
	* @return Interspire_Template
	*/
	public static function getInstance($instance, $templatePaths = null, $options = array())
	{
		if(empty(self::$instances[$instance])) {
			self::$instances[$instance] = new self($templatePaths, $options);
		}
		return self::$instances[$instance];
	}

	public function assign($name, $value)
	{
		$this->assignedVars[$name] = $value;
		return $this;
	}

	public function getAssignedVars()
	{
		return $this->assignedVars;
	}

	public function render($template, $context=array())
	{
		$template = $this->loadTemplate($template);
		return $template->render($this->assignedVars + $context + $GLOBALS);
	}

	public function display($template, $context=array())
	{
		$template = $this->loadTemplate($template);
		$template->display($this->assignedVars + $context + $GLOBALS);
	}

	public function getCacheFilename($name)
	{
		// this method is the old behvaiour, before Twig core changed to use sub-directories
		return $this->getCache() ? $this->getCache().'/'.$this->getTemplateClass($name).'.php' : false;
	}

	public function clearCacheFiles()
	{
		// this method is the old behvaiour, before Twig core changed to use sub-directories
		if ($this->cache) {
			foreach(new DirectoryIterator($this->cache) as $fileInfo) {
				if (0 === strpos($fileInfo->getFilename(), $this->templateClassPrefix)) {
					@unlink($fileInfo->getPathname());
				}
			}
		}
	}
}
