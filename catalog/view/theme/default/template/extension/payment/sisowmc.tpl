<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowideal_payment" class="checkout-content">
  <img src="catalog/view/theme/default/image/bancontact.png" alt="Bancontact" title="Bancontact" style="vertical-align: middle;" /><br/>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowsofort_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowsofort_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=extension/payment/sisowmc/redirectbank',
		data: $('#sisowideal_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowsofort_confirm').button('loading');
		},
		complete: function() {
			$('#sisowsofort_confirm').button('reset');
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
