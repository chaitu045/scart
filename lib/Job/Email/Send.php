<?php

class Job_Email_Send extends Job_Store_Abstract
{
	public function perform()
	{
		require_once ISC_BASE_PATH . "/lib/email.php";

		/** @var Email_API */
		$email = @unserialize($this->args['email']);
		$result = $email->Send();

		if ($result['success']) {
			return true;
		}

		$recipient = $email->getRecipients();
		reset($recipient);
		$recipient = current($recipient);

		$message = GetLang('Job_Email_Send_Error', array(
			'recipient_name' => $recipient['name'],
			'recipient_address' => $recipient['address'],
		));

		$details = '';

		foreach ($result['fail'] as $failure) {
			$details .= $failure[0] . ': ' . $failure[1] . '<br/>';
		}

		$GLOBALS['ISC_CLASS_LOG']->LogSystemError('general', $message, $details);
		return false;
	}
}
