<form id="sisowfocum_payment" class="form-horizontal">
	<fieldset>
		<legend>
			<img src="https://www.achterafbetalen.nl/files/logo.png" alt="Achteraf Betalen" height="70px" title="Achteraf Betalen" style="vertical-align: middle;" /><br/>
			<?php echo $text_description; ?>
		</legend>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label" for="gender">Aanhef</label>
			<div class="col-sm-10">
				<select name="sisowgender" id="gender" class="form-control">
					<option value="">Kies aanhef</option>
					<option value="M">De heer</option>
					<option value="F">Mevrouw</option>
				</select>
			</div>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label" for="sisowphone">Telefoonnummer</label>
			<div class="col-sm-10">
				<input type="text" id="sisowphone" name="sisowphone" class="form-control" maxlength="12" value="" />
			</div>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label" for="sisowiban">IBAN</label>
			<div class="col-sm-10">
				<input type="text" id="sisowiban" name="sisowiban" class="form-control" maxlength="22" value="" />
			</div>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label" for="sisowday">Geboortedatum</label>
			<div class="col-sm-10">
				<div class="col-sm-3" style="padding-left: 0px;">
					<select id="sisowday" name="sisowday" class="form-control">
						<option value="">Dag</option>
						<?php for($i = 1; $i < 32; $i++) { ?>
							<option value="<?php print_r(sprintf("%02d", $i)); ?>"><?php echo $i; ?></option>
						<?php } ?>
					</select>
				</div>
				<div class="col-sm-3">
					<select id="sisowmonth" name="sisowmonth" class="form-control">
						<option value="">Maand</option>
						<?php for($i = 1; $i < 13; $i++) { ?>
							<option value="<?php print_r(sprintf("%02d", $i)); ?>"><?php echo $i; ?></option>
						<?php } ?>
					</select>
				</div>
				<div class="col-sm-3">
					<select id="sisowyear" name="sisowyear" class="form-control">
						<option value="">Jaar</option>
						<?php for($i = date("Y") - 17; $i > date("Y") - 150; $i--) { ?>
							<option value="<?php print_r(sprintf("%02d", $i)); ?>"><?php echo $i; ?></option>
						<?php } ?>
					</select>
				</div>
			</div>
		</div>
		
		<?php echo $text_paymentfee; ?>
	<fieldset>
</form>
	
<div class="row">
	<div class="pull-right">
		<a target="_blank" href="https://www.sisow.nl"><img src="https://www.sisow.nl/images/betaallogos/logo_sisow_klein.png" alt="Powered by Sisow" height="25px"/></a>
	</div>
</div>
<div class="buttons pull-right">
	<input type="button" value="<?php echo $button_confirm; ?>" id="sisowfocum_confirm" class="btn btn-primary" />
</div>
<script type="text/javascript"><!--
	$('#sisowfocum_confirm').on('click', function() {
		$.ajax({ 
			type: 'POST',
			url: 'index.php?route=extension/payment/sisowfocum/redirectbank',
			data: $('#sisowfocum_payment :input'),
			dataType: 'json',
			cache: false,
			beforeSend: function() {
				$('#sisowfocum_confirm').button('loading');
			},
			complete: function() {
				$('#sisowfocum_confirm').button('reset');
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
	//-->
</script>

