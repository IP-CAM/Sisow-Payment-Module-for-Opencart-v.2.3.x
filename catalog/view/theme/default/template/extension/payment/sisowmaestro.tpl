<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowideal_payment" class="checkout-content">
  <img src="catalog/view/theme/default/image/maestro.png" height="75px"/>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowmaestro_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowmaestro_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=extension/payment/sisowmaestro/redirectbank',
		data: $('#sisowideal_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowmaestro_confirm').button('loading');
		},
		complete: function() {
			$('#sisowmaestro_confirm').button('reset');
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
