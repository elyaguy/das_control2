<form id="create-college-form" class="form-horizontal" action="college.php" method="post" enctype="multipart/form-data">
  <input type="hidden" id="action_type" name="action_type" value="CREATE">
  <div class="box-body">

    <div class="nav-tabs-custom">
      <ul class="nav nav-tabs">
        <li class="active">
          <a href="#general" data-toggle="tab" aria-expanded="false">
            <?php echo trans('text_general'); ?>
          </a>
        </li>
        <!-- <li class="">
          <a href="#product-setting" data-toggle="tab" aria-expanded="false">
            <?/*php echo trans('text_product_setting'); */ ?>
          </a>
        </li> -->
        <li class="">
          <a href="#product-setting" data-toggle="tab" aria-expanded="false">
            <?php echo trans('text_product_setting') ?>
          </a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="general">
          <div class="form-group">
            <label for="college_name" class="col-sm-3 control-label">
              <?php echo sprintf(trans('label_name'), null); ?><i class="required">*</i>
            </label>
            <div class="col-sm-7">
              <input type="text" class="form-control" id="college_name" name="college_name" value="<?php echo isset($request->post['college_name']) ? $request->post['college_name'] : null; ?>" ng-model="collegeName" required>
            </div>
          </div>

          <div class="form-group">
            <label for="code_name" class="col-sm-3 control-label">
              <?php echo trans('label_code_name'); ?><i class="required">*</i>
            </label>
            <div class="col-sm-7">
              <input type="text" class="form-control" id="code_name" value="{{ collegeName | strReplace:' ':'_' | lowercase }}" name="code_name" required>
            </div>
          </div>

          <!-- <div class="form-group">
            <label class="col-sm-3 control-label">
              <?/*php echo trans('label_store'); */ ?><i class="required">*</i>
            </label>
            <div class="col-sm-7 store-selector">
              <div class="checkbox selector">
                <label>
                  <input type="checkbox" onclick="$('input[name*=\'college_store\']').prop('checked', this.checked);"> Seleccionar / Deseleccionar
                </label>
              </div>
              <div class="filter-searchbox">
                <input ng-model="search_store" class="form-control" type="text" id="search_store" placeholder="<?/*php echo trans('search'); */ ?>">
              </div>
              <div class="well well-sm store-well">
                <div filter-list="search_store">
                  <?/*php foreach (get_stores() as $the_store) : */ ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="college_store[]" value="<?/*php echo $the_store['store_id']; */ ?>" <?/*php echo $the_store['store_id'] == store_id() ? 'checked' : null; */ ?>>
                        <?/*php echo $the_store['name']; */ ?>
                      </label>
                    </div>
                  <?/*php endforeach; */ ?>
                </div>
              </div>
            </div>
          </div> -->

          <div class="form-group">
            <label for="college_details" class="col-sm-3 control-label">
              <?php echo trans('label_responsible'); ?><i class="required">*</i>
            </label>
            <div class="col-sm-7">
              <textarea class="form-control" id="college_details" name="college_details" value="<?php echo isset($request->post['college_details']) ? $request->post['college_details'] : null; ?>" required></textarea>
            </div>
          </div>

          <div class="form-group hidden">
            <label for="status" class="col-sm-3 control-label">
              <?php echo trans('label_status'); ?><i class="required">*</i>
            </label>
            <div class="col-sm-7">
              <select id="status" class="form-control" name="status">
                <option <?php echo isset($request->post['status']) && $request->post['status'] == '1' ? 'selected' : null; ?> value="1">
                  <?php echo trans('text_active'); ?>
                </option>
                <option <?php echo isset($request->post['status']) && $request->post['status'] == '0' ? 'selected' : null; ?> value="0">
                  <?php echo trans('text_in_active'); ?>
                </option>
              </select>
            </div>
          </div>
        </div>

        <div class="tab-pane" id="product-setting">
          <div class="form-group">
            <div class="input-group wide-tip">
              <div class="input-group-addon paddinglr-10">
                <i class="fa fa-barcode addIcon fa-2x"></i>
              </div>
              <input type="text" name="add_item" value="" class="form-control input-lg autocomplete-product" id="add_item" data-type="p_name" onkeypress="return event.keyCode != 13;" onclick="this.select();" placeholder="<?php echo trans('placeholder_search_product'); ?>" autocomplete="off" tabindex="1">
            </div>

            <h4>
              <b><i><?php echo trans('text_items_list_select'); ?></i></b>
            </h4>
            <div class="row">
              <div class="col-md-12">
                <div class="table-responsive">
                  <table id="product-table" class="table table-striped table-bordered mb-0">
                    <thead>
                      <tr class="bg-info">
                        <th class="w-55 text-center">
                          <?php echo trans('label_product_name'); ?>
                        </th>
                        <th class="w-15 text-center">
                          <?php echo trans('label_PVP'); ?>
                        </th>
                        <th class="w-15 text-center">
                          <?php echo trans('label_estimated_sales'); ?>
                        </th>
                        <th class="w-15 text-center">
                          <?php echo trans('label_PVP_new'); ?>
                        </th>
                        <th class="w-15 text-center">
                          <?php echo trans('label_commission_percent'); ?>
                        </th>
                        <th class="w-15 text-center">
                          <?php echo trans('label_commission_USD'); ?>
                        </th>
                        <th class="w-5 text-center">
                          <i class="fa fa-trash-o"></i>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>           
                  </table>
                </div>
              </div>
            </div>       
          </div>
        </div>

      </div>
    </div>
    <div class="box-footer">
      <div class="form-group">
        <label class="col-sm-3 control-label"></label>
        <div class="col-sm-7">
          <button class="btn btn-info" id="create-college-submit" type="submit" name="create-college-submit" data-form="#create-college-form" data-loading-text="Guardando...">
            <span class="fa fa-fw fa-save"></span>
            <?php echo trans('button_save'); ?>
          </button>
          <button type="reset" class="btn btn-danger" id="reset" name="reset"><span class="fa fa-fw fa-circle-o"></span>
            <?php echo trans('button_reset'); ?>
          </button>
        </div>
      </div>
    </div>

    <div class="form-group hidden">
      <label for="college_image" class="col-sm-3 control-label">
        <?php echo sprintf(trans('label_thumbnail'), null); ?>
      </label>
      <div class="col-sm-7">
        <div class="preview-thumbnail">
          <a ng-click="POSFilemanagerModal({target:'college_image',thumb:'college_thumb'})" onClick="return false;" href="#" data-toggle="image" id="college_thumb">
            <img src="../assets/das/img/noimage.jpg" alt="">
          </a>
          <input type="hidden" name="college_image" id="college_image" value="">
        </div>
      </div>
    </div>

  </div>
</form>