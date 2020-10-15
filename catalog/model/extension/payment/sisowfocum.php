<?php 

class ModelExtensionPaymentSisowFocum extends Model {
	public function getMethod($address = false, $total = false) {
		if (!$this->config->get('sisowfocum_status')) {
			return false;
		}
		
		if ($this->session->data['currency'] != 'EUR') {
			return false;
		}
		
		if ($this->config->get('sisowfocum_geo_zone_id')) {
      		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('sisowfocum_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			if (!$query->num_rows) {
     	  		return false;
			}	
		}

		if ($total) {
			if ($this->config->get('sisowfocum_total') && $total < $this->config->get('sisowfocum_total')) {
				return false;
			}
			if ($this->config->get('sisowfocum_totalmax') && $total > $this->config->get('sisowfocum_totalmax')) {
				return false;
			}
		}

		$this->load->language('extension/payment/sisowfocum');
		$data = array(
			'terms'      => '',
			'code'		=> 'sisowfocum',
			'title'		=> $this->language->get('text_title').($this->config->get('sisowfocum_testmode') == 'true' ? ' [Testmode]' : ''),
			'sort_order'	=> $this->config->get('sisowfocum_sort_order')
			);
		return $data;
	}
}
?>
