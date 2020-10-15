<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			  <div class="pull-right">
				<button type="submit" form="form-ppexpress" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a> </div>
			  <h1><?php echo $heading_title; ?></h1>
			  <ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			  </ul>
		</div>
	</div>
	<div class="container-fluid">
	<?php if (isset($error['error_warning'])) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-ppexpress" class="form-horizontal">
		<div class="form-group required">
			<label class="col-sm-2 control-label" for="entry_merchantid"><?php echo $entry_merchantid; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowmastercard_merchantid" value="<?php echo $sisowmastercard_merchantid; ?>" id="entry_merchantid" class="form-control" maxlength="32" size = "32"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label" for="entry_merchantkey"><?php echo $entry_merchantkey; ?></label>
			<div class="col-sm-4">
				<input type="text" name="sisowmastercard_merchantkey" value="<?php echo $sisowmastercard_merchantkey; ?>" id="entry_merchantkey" class="form-control" maxlength="64" size = "64"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>	
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_shopid"><?php echo $entry_shopid; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowmastercard_shopid" value="<?php echo $sisowmastercard_shopid; ?>" id="entry_shopid" class="form-control" maxlength="8" size = "8"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_success"><?php echo $entry_success; ?></label>
			<div class="col-sm-2">
				<select name="sisowmastercard_status_success" id="entry_success" class="form-control">
				<?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $sisowmastercard_status_success) { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
				<?php } ?>
				<?php } ?>
			  </select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_paymentfee"><?php echo $entry_paymentfee; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowmastercard_paymentfee" value="<?php echo $sisowmastercard_paymentfee; ?>" id="entry_paymentfee" class="form-control" maxlength="8" size = "8"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_sisowmastercard_fee_tax"><?php echo $entry_sisow_fee_tax; ?></label>
			<div class="col-sm-2">
				<select name="sisowmastercard_fee_tax" id="entry_sisowmastercard_fee_tax" class="form-control">
					<option value=""><?php echo $text_none; ?></option>
					<?php foreach ($tax_classes as $tax_class) { ?>
					<?php if ($tax_class['tax_class_id'] == $sisowmastercard_fee_tax) { ?>
					<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
					<?php } ?>
					<?php } ?>
              </select></td>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_testmode"><?php echo $entry_testmode; ?></label>
			<div class="col-sm-2">
					<select name="sisowmastercard_testmode" id="entry_testmode" class="form-control">
					<?php if ($sisowmastercard_testmode=="true") { ?>
					<option value="true" selected="selected"><?php echo $text_yes; ?></option>
					<option value="false"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="true"><?php echo $text_yes; ?></option>
					<option value="false" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_total"><?php echo $entry_total; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowmastercard_total" value="<?php echo $sisowmastercard_total; ?>" id="entry_total" class="form-control" maxlength="8" size = "8"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_totalmax"><?php echo $entry_totalmax; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowmastercard_totalmax" value="<?php echo $sisowmastercard_totalmax; ?>" id="entry_totalmax" class="form-control" maxlength="8" size = "8"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_geo_zone"><?php echo $entry_geo_zone; ?></label>
			<div class="col-sm-2">
					<select name="sisowmastercard_geo_zone_id" id="entry_geo_zone" class="form-control">
					  <option value="0"><?php echo $text_all_zones; ?></option>
					  <?php foreach ($geo_zones as $geo_zone) { ?>
					  <?php if ($geo_zone['geo_zone_id'] == $sisowmastercard_geo_zone_id) { ?>
					  <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
					  <?php } else { ?>
					  <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
					  <?php } ?>
					  <?php } ?>
					</select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_status"><?php echo $entry_status; ?></label>
			<div class="col-sm-2">
					<select name="sisowmastercard_status" id="entry_status" class="form-control">
						<?php if ($sisowmastercard_status) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>
					  </select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_sort_order"><?php echo $entry_sort_order; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowmastercard_sort_order" value="<?php echo $sisowmastercard_sort_order; ?>" id="entry_sort_order" class="form-control" maxlength="8" size = "8"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<?php echo $entry_version_status ?>: 
				<?php echo $text_version ?>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				Sisow B.V.<br />
				Email: <a href="mailto:support@sisow.nl">support@sisow.nl</a><br />
				Web: <a href="http://www.sisow.nl" target="_blank">http://www.sisow.nl</a><br />
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<img src="view/image/payment/sisow.png" alt="Sisow" title="Sisow" height="60" />
			</div>
		</div>
	</form>	
</div>
<?php echo $footer; ?> 