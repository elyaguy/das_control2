<form id="create-college-form" class="form-horizontal" action="college.php" method="post" enctype="multipart/form-data">
  <input type="hidden" id="action_type" name="action_type" value="CREATE">
  <div class="box-body">
    
    <div class="form-group">
      <label for="college_name" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_name'), null); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="college_name" name="college_name" value="<?php echo isset($request->post['college_name']) ? $request->post['college_name'] : null; ?>" required>
      </div>
    </div>

    <div class="form-group">
      <label for="college_email" class="col-sm-3 control-label">
        <?php echo trans('label_email'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <input type="email" class="form-control" id="college_email" name="college_email" value="<?php echo isset($request->post['college_email']) ? $request->post['college_email'] : null; ?>" required>
      </div>
    </div>

    <div class="form-group">
      <label for="college_mobile" class="col-sm-3 control-label">
        <?php echo trans('label_mobile'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="college_mobile" name="college_mobile" value="<?php echo isset($request->post['college_mobile']) ? $request->post['college_mobile'] : null; ?>" required>
      </div>
    </div>

    <div class="form-group">
      <label for="college_address" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_address'), null); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <textarea class="form-control" id="college_address"  name="college_address" value="<?php echo isset($request->post['college_address']) ? $request->post['college_address'] : null; ?>" required></textarea>
      </div>
    </div>

    <div class="form-group">
      <label for="college_city" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_city'), null); ?>
      </label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="college_city" value="<?php echo isset($request->post['college_city']) ? $request->post['college_city'] : null; ?>" name="college_city">
      </div>
    </div>

    <?php if (get_preference('invoice_view') == 'indian_gst') : ?>
    <div class="form-group">
      <label for="college_state" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_state'), null); ?>
      </label>
      <div class="col-sm-7">
        <?php echo stateSelector(isset($request->post['college_state']) ? $request->post['college_state'] : null, 'college_state', 'college_state'); ?>
      </div>
    </div>
    <?php else : ?>
      <div class="form-group">
        <label for="college_state" class="col-sm-3 control-label">
          <?php echo sprintf(trans('label_state'), null); ?>
        </label>
        <div class="col-sm-7">
          <input type="text" class="form-control" id="college_state" value="<?php echo isset($request->post['college_state']) ? $request->post['college_state'] : null; ?>" name="college_state">
        </div>
      </div>
    <?php endif; ?>

    <div class="form-group">
      <label for="country" class="col-sm-3 control-label">
        <?php echo trans('label_country'); ?>
      </label>
      <div class="col-sm-7">
        <?php echo countrySelector(isset($request->post['college_country']) ? $request->post['college_country'] : null, 'college_country', 'college_country'); ?>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label">
        <?php echo trans('label_store'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7 store-selector">
        <div class="checkbox selector">
          <label>
            <input type="checkbox" onclick="$('input[name*=\'college_store\']').prop('checked', this.checked);"> Select / Deselect
          </label>
        </div>
        <div class="filter-searchbox">
          <input ng-model="search_store" class="form-control" type="text" id="search_store" placeholder="<?php echo trans('search'); ?>">
        </div>
        <div class="well well-sm store-well"> 
          <div filter-list="search_store">
            <?php foreach(get_stores() as $the_store) : ?>                    
              <div class="checkbox">
                <label>                         
                  <input type="checkbox" name="college_store[]" value="<?php echo $the_store['store_id']; ?>" <?php echo $the_store['store_id'] == store_id() ? 'checked' : null; ?>>
                  <?php echo $the_store['name']; ?>
                </label>
              </div>
            <?php endforeach; ?>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label for="college_details" class="col-sm-3 control-label">
        <?php echo trans('label_details'); ?>
      </label>
      <div class="col-sm-7">
        <textarea class="form-control" id="college_details"  name="college_details" value="<?php echo isset($request->post['college_details']) ? $request->post['college_details'] : null; ?>" required></textarea>
      </div>
    </div>

    <div class="form-group">
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

    <div class="form-group">
      <label for="sort_order" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_sort_order'), null); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <input type="number" class="form-control" id="sort_order" value="<?php echo isset($request->post['sort_order']) ? $request->post['sort_order'] : 0; ?>" name="sort_order" required>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label"></label>
      <div class="col-sm-7">
        <button class="btn btn-info" id="create-college-submit" type="submit" name="create-college-submit" data-form="#create-college-form" data-loading-text="Saving...">
          <span class="fa fa-fw fa-save"></span>
          <?php echo trans('button_save'); ?>
        </button>
        <button type="reset" class="btn btn-danger" id="reset" name="reset"><span class="fa fa-fw fa-circle-o"></span>
          <?php echo trans('button_reset'); ?>
        </button>
      </div>
    </div>
    
  </div>
</form>