<form id="create-pmethod-form" class="form-horizontal" action="pmethod.php" method="post" enctype="multipart/form-data">
  <input type="hidden" id="action_type" name="action_type" value="CREATE">
  <div class="box-body">

    <div class="form-group">
      <label for="pmethod_name" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_name'), null); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="pmethod_name" value="<?php echo isset($request->post['pmethod_name']) ? $request->post['pmethod_name'] : null; ?>" name="pmethod_name" ng-model="pmethodName" required>
      </div>
    </div>

    <div class="form-group">
        <label for="code_name" class="col-sm-3 control-label">
          <?php echo trans('label_code_name'); ?><i class="required">*</i>
        </label>
        <div class="col-sm-7">
          <input type="text" class="form-control" id="code_name" value="{{ pmethodName | strReplace:' ':'_' | lowercase }}" name="code_name" required>
        </div>
    </div>

    <div class="form-group">
      <label for="pmethod_details" class="col-sm-3 control-label">
        <?php echo trans('label_details'); ?>
      </label>
      <div class="col-sm-7">
        <textarea class="form-control" id="pmethod_details" name="pmethod_details"><?php echo isset($request->post['pmethod_details']) ? $request->post['pmethod_details'] : false; ?></textarea>
      </div>
    </div>

    <!-- <div class="form-group">
      <label class="col-sm-3 control-label">
        <?/*php echo trans('label_store'); */?><i class="required">*</i>
      </label>
      <div class="col-sm-7 store-selector">
        <div class="checkbox selector">
          <label>
            <input type="checkbox" onclick="$('input[name*=\'pmethod_store\']').prop('checked', this.checked);"> Seleccionar / Deseleccionar
          </label>
        </div>
        <div class="filter-searchbox">
          <input ng-model="search_store" class="form-control" type="text" id="search_store" placeholder="<?/*php echo trans('search'); */?>">
        </div>
        <div class="well well-sm store-well"> 
          <div filter-list="search_store">
            <?/*php foreach(get_stores() as $the_store) : */?>                    
              <div class="checkbox">
                <label>                         
                  <input type="checkbox" name="pmethod_store[]" value="<?/*php echo $the_store['store_id']; */?>" <?/*php echo $the_store['store_id'] == store_id() ? 'checked' : null; */?>>
                  <?/*php echo $the_store['name']; */?>
                </label>
              </div>
            <?/*php endforeach; */?>
          </div>
        </div>
      </div>
    </div> -->

    <div class="form-group hidden">
      <label for="status" class="col-sm-3 control-label">
        <?php echo trans('label_status'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <select id="status" class="form-control" name="status" >
          <option <?php echo isset($request->post['status']) && $request->post['status'] == '1' ? 'selected' : null; ?> value="1">
            <?php echo trans('text_active'); ?>
          </option>
          <option <?php echo isset($request->post['status']) && $request->post['status'] == '0' ? 'selected' : null; ?> value="0">
            <?php echo trans('text_in_active'); ?>
          </option>
        </select>
      </div>
    </div>

    <!-- <div class="form-group">
      <label for="sort_order" class="col-sm-3 control-label">
        <?/*php echo sprintf(trans('label_sort_order'), null); */?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="sort_order" value="<?/*php echo isset($request->post['sort_order']) ? $request->post['sort_order'] : 0; */?>" name="sort_order" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" onKeyUp="if(this.value<0){this.value='1';}" required>
      </div>
    </div> -->

    <div class="form-group">
      <label class="col-sm-3 control-label"></label>
      <div class="col-sm-7">
        <button class="btn btn-info" id="create-pmethod-submit" type="submit" name="create-pmethod-submit" data-form="#create-pmethod-form" data-loading-text="Guardando...">
          <span class="fa fa-fw fa-save"></span> 
          <?php echo trans('button_save'); ?>
        </button>
        <button type="reset" class="btn btn-danger" id="reset" name="reset">
          <span class="fa fa-fw fa-circle"></span>
          <?php echo trans('button_reset'); ?>
        </button>
      </div>
    </div>
    
  </div>
</form>