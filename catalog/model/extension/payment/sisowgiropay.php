<?php 

class ModelExtensionPaymentSisowGiropay extends Model {
	public function getMethod($address = false, $total = false) {
		if (!$this->config->get('sisowgiropay_status')) {
			return false;
		}
		
		/*if ($this->currency->getCode() != 'EUR') {
			return false;
		}*/
		
		if ($this->config->get('sisowgiropay_geo_zone_id')) {
      		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('sisowgiropay_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			if (!$query->num_rows) {
     	  		return false;
			}	
		}

		if ($total) {
			if ($this->config->get('sisowgiropay_total') && $total < $this->config->get('sisowgiropay_total')) {
				return false;
			}
			if ($this->config->get('sisowgiropay_totalmax') && $total > $this->config->get('sisowgiropay_totalmax')) {
				return false;
			}
		}

		$this->load->language('extension/payment/sisowgiropay');
		$data = array(
			'code'		=> 'sisowgiropay',
			'title'		=> $this->language->get('text_title').($this->config->get('sisowgiropay_testmode') == 'true' ? ' [Testmode]' : ''),
			'terms'      => '',
			'sort_order'	=> $this->config->get('sisowgiropay_sort_order')
			);
		return $data;
	}
}
?>
