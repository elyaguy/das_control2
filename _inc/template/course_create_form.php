<form id="create-course-form" class="form-horizontal" action="course.php" method="post" enctype="multipart/form-data">
  <input type="hidden" id="action_type" name="action_type" value="CREATE">
  <div class="box-body">

    <div class="form-group hidden">
      <label for="course_image" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_thumbnail'),null); ?>
      </label>
      <div class="col-sm-7">
        <div class="preview-thumbnail">
          <a ng-click="POSFilemanagerModal({target:'course_image',thumb:'course_thumb'})" onClick="return false;" href="#" data-toggle="image" id="course_thumb">
            <img src="../assets/das/img/noimage.jpg" alt="">
          </a>
          <input type="hidden" name="course_image" id="course_image" value="">
        </div>
      </div>
    </div>
    
    <div class="form-group">
      <label for="course_name" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_name'), null); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="course_name" name="course_name" value="<?php echo isset($request->post['course_name']) ? $request->post['course_name'] : null; ?>" ng-model="courseName" required>
      </div>
    </div>

    <div class="form-group hidden">
      <label for="code_name" class="col-sm-3 control-label">
        <?php echo trans('label_code_name'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="code_name" value="{{ courseName | strReplace:' ':'_' | lowercase }}" name="code_name" required>
      </div>
    </div>

    <!-- <div class="form-group">
      <label class="col-sm-3 control-label">
        <?/*php echo trans('label_store'); */?><i class="required">*</i>
      </label>
      <div class="col-sm-7 store-selector">
        <div class="checkbox selector">
          <label>
            <input type="checkbox" onclick="$('input[name*=\'course_store\']').prop('checked', this.checked);"> Seleccionar / Deseleccionar
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
                  <input type="checkbox" name="course_store[]" value="<?/*php echo $the_store['store_id']; */?>" <?/*php echo $the_store['store_id'] == store_id() ? 'checked' : null; */?>>
                  <?/*php echo $the_store['name']; */?>
                </label>
              </div>
            <?/*php endforeach; */?>
          </div>
        </div>
      </div>
    </div> -->

    <div class="form-group hidden">
      <label for="course_details" class="col-sm-3 control-label">
        <?php echo trans('label_details'); ?>
      </label>
      <div class="col-sm-7">
        <textarea class="form-control" id="course_details"  name="course_details" value="<?php echo isset($request->post['course_details']) ? $request->post['course_details'] : null; ?>" required></textarea>
      </div>
    </div>

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

    <div class="form-group hidden">
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
        <button class="btn btn-info" id="create-course-submit" type="submit" name="create-course-submit" data-form="#create-course-form" data-loading-text="Guardando...">
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