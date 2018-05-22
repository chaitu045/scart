<?php
if (!defined('ISC_BASE_PATH')) {
	die();
}

class ISC_ADMIN_REMOTE_DASHBOARD extends ISC_ADMIN_REMOTE_BASE
{
	public function HandleToDo()
	{
		$what = isc_strtolower(@$_REQUEST['w']);
		switch($what) {
			case 'loadrecentorders':
				$this->LoadRecentOrders();
				break;
			case 'getperformanceindicators':
				$this->GetPerformanceIndicators();
				break;
			case 'announcementsmodal':
				$this->announcementsModal();
				break;
			case 'closeannouncementsmodal':
				$this->closeAnnouncementsModal();
				break;
		}
	}

	public function closeAnnouncementsModal()
	{
		$_SESSION['HideAnnouncementsModal'] = true;

		if (@$_REQUEST['hide']) {
			// mark the user's record has having seen PRODUCT_VERSION_CODE announcements
			$this->db->UpdateQuery('users', array(
				'announcement' => PRODUCT_VERSION_CODE,
			), "pk_userid = " . $this->auth->GetUserId());
		}
	}

	public function announcementsModal()
	{
		// discover announcements for user
		$user = $this->auth->GetUser();
		$seen = max(6106, (int)$user['announcement']);
		$announcements = array();

		foreach (GetClass('ISC_ADMIN_UPGRADE')->getVersions() as $code => $description) {
			if ($code <= $seen) {
				// ignore versions already seen
				continue;
			}

			if (file_exists(ISC_BASE_PATH . '/admin/templates/announcements/' . $code . '.tpl')) {
				$announcements[] = $code;
			}
		}

		$this->template->assign('announcements', $announcements);
		$this->template->display('announcements.modal.tpl');
	}

	public function LoadRecentOrders()
	{
		echo GetClass('ISC_ADMIN_INDEX')->LoadRecentOrders();
	}

	public function GetPerformanceIndicators()
	{
		echo GetClass('ISC_ADMIN_INDEX')->GeneratePerformanceIndicatorsTable();
	}

	/**
	 * Generate the list of video walkthroughs.
	 */
}