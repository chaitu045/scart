<?php
class Job_Controller
{
	protected $controllerId;

	protected function __construct($id)
	{
		$this->controllerId = $id;
		$this->keystore = Interspire_KeyStore_Mysql::instance();
	}

	static public function findById($controllerId)
	{
		$controller = new Job_Controller($controllerId);
		return $controller;
	}

	static public function create($jobGroup)
	{
		$id = self::generateId($jobGroup);
		$controller = new Job_Controller($id);
		$controller->init();

		return $controller;
	}

	static protected function generateId($prefix)
	{
		return uniqid($prefix.rand());
	}

	protected function init()
	{
		$this->setProgress(0, '');
	}

	protected function delete()
	{
		$this->deleteValue('progress');
	}

	public function getId()
	{
		return $this->controllerId;
	}

	public function getProgress()
	{
		return $this->getValue('progress');
	}

	public function setProgress($value, $message=null, $running=true)
	{
		$progress = array(
			'progress' => $value,
			'message' => $message,
			'running' => $running
		);

		$this->setValue('progress', $progress);
	}

	public function getValue($name)
	{
		$key = $this->key($name);
		return json_decode($this->keystore->get($key), true);
	}

	public function setValue($name, $value)
	{
		$key = $this->key($name);
		return $this->keystore->set($key, json_encode($value));
	}

	public function deleteValue($name)
	{
		$key = $this->key($name);
		return $this->keystore->delete($key);
	}

	protected function key($name)
	{
		return $this->controllerId.'_'.$name;
	}
}
