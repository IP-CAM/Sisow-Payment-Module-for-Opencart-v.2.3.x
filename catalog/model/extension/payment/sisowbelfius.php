<?php 

class ModelExtensionPaymentSisowBelfius extends Model {
	public function getMethod($address = false, $total = false) {
		if (!$this->config->get('sisowbelfius_status')) {
			return false;
		}
		
		/*if ($this->currency->getCode() != 'EUR') {
			return false;
		}*/
		
		if ($this->config->get('sisowbelfius_geo_zone_id')) {
      		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('sisowbelfius_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			if (!$query->num_rows) {
     	  		return false;
			}	
		}

		if ($total) {
			if ($this->config->get('sisowbelfius_total') && $total < $this->config->get('sisowbelfius_total')) {
				return false;
			}
			if ($this->config->get('sisowbelfius_totalmax') && $total > $this->config->get('sisowbelfius_totalmax')) {
				return false;
			}
		}

		$this->load->language('extension/payment/sisowbelfius');
		$data = array( 
			'terms'      => '',
			'code'		=> 'sisowbelfius',
			'title'		=> $this->language->get('text_title').($this->config->get('sisowbelfius_testmode') == 'true' ? ' [Testmode]' : ''),
			'sort_order'	=> $this->config->get('sisowbelfius_sort_order')
			);
		return $data;
	}
}
?>
