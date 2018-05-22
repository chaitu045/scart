<?php
class Job_ShoppingComparison_RunExport extends Job_Store_Abstract
{
	protected $taskId;
	protected $cache;
	protected $exporter;
	protected $controller;

	public $stepSize = 1000;
	public $resume = false;
	protected $writeSuccess = false;

	public function perform()
	{
        $_engine = getClass('ISC_ADMIN_ENGINE');
        $_engine->LoadLangFile('shoppingcomparison');

		$moduleId = $this->args['module'];
		GetModuleById('shoppingcomparison', $module, $moduleId);

		if(!$module){
			error_log('No module');
			return;
		}

		if(!isset($this->args['controller'])
			|| !($controllerId = $this->args['controller']))
		{
			error_log("No controller for export task. Aborting");
			return;
		}

		$this->init($module, $controllerId);
		$this->run();
	}

	protected function init($exporter, $controllerId)
	{
		$this->exporter		= $exporter;
		$this->controller	= Job_Controller::findById($controllerId);
		$this->taskId		= $controllerId;
		$this->cache		= Interspire_KeyStore_Mysql::instance();
		$this->load();
	}

	public function transitions()
	{
		return array(
			'start' => array(
				array('on' => 'isNew', 'next' => 'newExport'),
				array('on' => 'isResume', 'next' => 'resumeExport')
			),
			'newExport'=> 'writeHead',
			'resumeExport' => 'writeRows',
			'writeHead' => 'writeRows',
			'writeRows' => array(
				array('on' => 'isAbort', 'next' => 'abort'),
				array('on' => 'isContinue', 'next' => 'requeueExport'),
				array('on' => 'isWriteSuccess', 'next' => 'complete')
			),
			'abort' => null,
			'requeueExport' => null,
			'complete' => null);
	}

	public function run()
	{
		$state = new Interspire_StateExecutor($this);
		$state->execute($this->transitions());
	}

	public function newExport()
	{
		$this->filename		= $this->exporter->getExportFile();
		$this->totalRows	= $this->exporter->getTotalRows();
		$this->currentRow	= 0;
		$this->output		= fopen($this->filename, 'w');
	}

	public function resumeExport()
	{
		$this->resume = false;
		$this->output = fopen($this->filename, 'a');
	}

	public function writeHead()
	{
		$head = $this->exporter->writeHead();
		fwrite($this->output, $head);
	}

	public function writeRows()
	{
		$db			= $GLOBALS['ISC_CLASS_DB'];
		$exporter	= $this->exporter;
		$currentRow	= $this->currentRow;
		$step		= $this->stepSize;

		if(!($rows = $exporter->getExportRows($currentRow, $step))){
			$this->isAbort(true);
			return;
		}

		if(mysql_num_rows($rows) <= 0){
			$this->isWriteSuccess(true);
			return;
		}

		while($row = $db->Fetch($rows)){
			$this->writeRow($row);
			$this->currentRow++;
			$this->updateProgress();

			if($this->currentRow >= $this->totalRows){
				$this->isWriteSuccess(true);
				return;
			}
		}
	}

	public function writeRow($row)
	{
		$buf = $this->exporter->writeRow($row);
		fwrite($this->output, $buf);
	}

	public function updateProgress()
	{
		if(!$this->totalRows){
			return;
		}

		$progress = ceil($this->currentRow / (float)$this->totalRows * 100);
		$this->controller->SetProgress(
			$progress,
			$this->exporter->exportProgressMessage($progress)
		);
	}

	public function abort()
	{
		fclose($this->output);
		$this->controller->deleteValue('export');
	}

	public function requeueExport()
	{
		fclose($this->output);
		$this->resume = true;
		$this->save();

		Interspire_TaskManager::createTask('shoppingcomparison',
			'Job_ShoppingComparison_RunExport',
			array("module" => $this->exporter->getId(),
				"controller" => $this->controller->getId()));
	}

	public function complete()
	{
		fclose($this->output);
		$this->controller->deleteValue('export');

		$this->exporter->exportEnd($this->controller);
		$this->controller->setProgress(100, $this->exporter->exportProgressMessage(100), false);
	}

	public function isNew()
	{
		return !$this->isResume();
	}

	public function isResume()
	{
		return (bool)$this->resume;
	}

	public function isAbort()
	{
		if($this->exporter->getCurrentExportId() != $this->controller->getId()){
			return true;
		}

		return false;
	}

	public function isWait()
	{
		return false;
	}

	public function isContinue()
	{
		return !$this->isWriteSuccess();
	}

	public function isRunning()
	{
		$running = $this->getValue('running');
		return isset($running) && $running;
	}

	public function isWriteSuccess($value=null)
	{
		if($value){
			return $this->writeSuccess = $value;
		}

		return $this->writeSuccess;
	}

	protected function save()
	{
		$exportData = array(
			'currentRow'	=> $this->currentRow,
			'totalRows'		=> $this->totalRows,
			'filename'		=> $this->filename,
			'resume'		=> $this->resume,
		);

		$this->controller->setValue('export', $exportData);
	}

	protected function load()
	{
		$exportData = $this->controller->getValue('export');

		if(is_array($exportData)) {
			$this->currentRow	= $exportData['currentRow'];
			$this->totalRows	= $exportData['totalRows'];
			$this->filename		= $exportData['filename'];
			$this->resume		= $exportData['resume'];
		}
	}
}
