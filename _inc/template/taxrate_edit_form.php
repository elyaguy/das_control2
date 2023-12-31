<h4 class="sub-title">
  <?php echo trans('text_update_title'); ?>
</h4>

<form class="form-horizontal" id="taxrate-form" action="taxrate.php" method="post">
  
  <input type="hidden" id="action_type" name="action_type" value="UPDATE">
  <input type="hidden" id="taxrate_id" name="taxrate_id" value="<?php echo $taxrate['taxrate_id']; ?>">

  <div class="box-body">
    
    <div class="form-group">
      <label for="taxrate_name" class="col-sm-3 control-label">
        <?php echo trans('label_taxrate_name'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="taxrate_name" value="<?php echo $taxrate['taxrate_name']; ?>" name="taxrate_name" ng-init="codeName='<?php echo $taxrate['code_name'] ? $taxrate['code_name'] : $taxrate['taxrate_name']; ?>'">
      </div>
    </div>

    <div class="form-group">
      <label for="code_name" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_code_name'), null); ?><i class="required">*</i>
      </label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="code_name" name="code_name"  value="<?php echo $taxrate['code_name'] ? $taxrate['code_name'] : "{{ codeName | strReplace:' ':'_' | lowercase }}"; ?>">
      </div>
    </div>

    <div class="form-group">
      <label for="taxrate" class="col-sm-3 control-label">
        <?php echo trans('label_taxrate'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="taxrate" value="<?php echo format_input_number($taxrate['taxrate']); ?>" name="taxrate" onclick="this.select();" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" onKeyUp="if(this.value<0){this.value='1';}" required>
      </div>
    </div>

    <div class="form-group">
      <label for="status" class="col-sm-3 control-label">
        <?php echo trans('label_status'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-8">
        <select id="status" class="form-control" name="status" >
          <option <?php echo isset($taxrate['status']) && $taxrate['status'] == '1' ? 'selected' : null; ?> value="1">
            <?php echo trans('text_active'); ?>
           </option>
          <option <?php echo isset($taxrate['status']) && $taxrate['status'] == '0' ? 'selected' : null; ?> value="0">
            <?php echo trans('text_in_active'); ?>
          </option>
        </select>
      </div>
    </div>

    <!-- <div class="form-group">
      <label for="sort_order" class="col-sm-3 control-label">
        <?/*php echo sprintf(trans('label_sort_order'), null); */?><i class="required">*</i>
      </label>
      <div class="col-sm-8">
        <input type="number" class="form-control" id="sort_order" value="<?/*php echo $taxrate['sort_order']; */?>" name="sort_order">
      </div>
    </div> -->

    <div class="form-group">
      <label for="taxrate_address" class="col-sm-3 control-label"></label>
      <div class="col-sm-8">            
        <button id="taxrate-update" class="btn btn-info"  data-form="#taxrate-form" data-datatable="#taxrate-taxrate-list" name="btn_edit_customer" data-loading-text="Actualizando Espera..!">
          <i class="fa fa-fw fa-pencil"></i>
          <?php echo trans('button_update'); ?>
        </button>
      </div>
    </div>

  </div>
</form>