<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowvpay_payment" class="checkout-content">
  <img src="catalog/view/theme/default/image/vpay.png" height="75px"/>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowvpay_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowvpay_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=extension/payment/sisowvpay/redirectbank',
		data: $('#sisowvpay_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowvpay_confirm').button('loading');
		},
		complete: function() {
			$('#sisowvpay_confirm').button('reset');
		},		
		success: function(json) {
			if (json['error']) {
				alert(json['error']);
			}
			
			if (json['redirect']) {
				location = json['redirect'];
			}
		}		
	});
});
//--></script> 
