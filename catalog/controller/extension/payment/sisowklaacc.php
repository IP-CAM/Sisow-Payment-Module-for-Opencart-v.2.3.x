<?php

include 'sisow.php';

class ControllerExtensionPaymentSisowKlaAcc extends ControllerExtensionPaymentSisow {
	public function index() {
		return $this->_index('sisowklaacc');
	}

	public function notify() {
		$this->_notify('sisowklaacc');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowklaacc');
	}
}
?>
