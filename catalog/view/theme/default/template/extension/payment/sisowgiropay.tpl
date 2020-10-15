<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowideal_payment" class="checkout-content">
  <img src="catalog/view/theme/default/image/giropay.png" alt="Giropay" title="Giropay" style="vertical-align: middle;" /><br/>
  Mit giropay zahlen Sie einfach, schnell und sicher im Online-Banking Ihrer teilnehmenden Bank oder Sparkasse. Sie werden direkt zum Online-Banking Ihrer Bank weitergeleitet, wo Sie die &Uuml;berweisung durch Eingabe von PIN und TAN freigeben.<br/>
<form id="payment" class="form-horizontal">
  <div class="form-group required">
	  <label class="col-sm-2 control-label" for="bic_giropay">Bankleitzahl:</label>
	  <div class="col-xs-10 col-sm-10 col-md-3 col-lg-2">
		<input type="text" name="bic_giropay" id="bic_giropay"  class="form-control"/>
	  </div>
	</div>
	</form>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowideal_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowideal_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=extension/payment/sisowgiropay/redirectbank',
		data: $('#sisowideal_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowideal_confirm').button('loading');
		},
		complete: function() {
			$('#sisowideal_confirm').button('reset');
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