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
          <!-- 
          <div class="form-group">
            <label for="sort_order" class="col-sm-3 control-label">
              <?/*php echo sprintf(trans('label_sort_order'), null); */ ?><i class="required">*</i>
            </label>
            <div class="col-sm-7">
              <input type="number" class="form-control" id="sort_order" value="<?/*php echo isset($request->post['sort_order']) ? $request->post['sort_order'] : 0; */ ?>" name="sort_order" required>
            </div>
          </div> -->

        </div>
        <!-- <div class="tab-pane" id="product-setting">
          <div class="form-group">
            <label class="col-sm-3 control-label"></label>
            <div class="col-sm-7 product-selector">
              <div class="checkbox selector">
                <label>
                  <input type="checkbox" onclick="$('input[name*=\'product\']').prop('checked', this.checked);"> Seleccionar / Deseleccionar
                </label>
              </div>
              <div class="filter-searchbox">
                <input ng-model="search_product" class="form-control" type="text" id="search_product" placeholder="<?/*php echo trans('search'); */ ?>">
              </div>
              <div class="well well-sm product-well">
                <div filter-list="search_product">
                  <?/*php foreach (get_products_to_store_college() as $the_store) : */ ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="product_college[]" value="<?/*php echo $the_store['p_id']; */ ?>" <?/*php echo in_array($the_store['p_id'], get_product_store_college()) ? 'checked' : null; */ ?>>
                        <?/*php echo $the_store['p_name'] . ' [ Curso: ' . $the_store['course_name'] . ' ]'; */ ?>
                      </label>
                    </div>
                  <?/*php endforeach; */ ?>

                </div>
              </div>
            </div>
          </div>
        </div> -->

        <div class="tab-pane" id="product-setting">
          <div class="form-group">
            <div class="box-body">
              <div class="table-responsive">
                <?php
                $print_columns = '0,1,2,3';
                // if (user_group_id() != 1) {
                //   if (!has_permission('access', 'show_purchase_price')) {
                //     $print_columns = str_replace('7,', '', $print_columns);
                //   }
                // }
                $hide_colums = "";
                //$hide_colums = "";
                // if (user_group_id() != 1) {
                //   if (!has_permission('access', 'product_bulk_action')) {
                //     $hide_colums .= "0,";
                //   }
                //   if (!has_permission('access', 'show_purchase_price')) {
                //     $hide_colums .= "7,";
                //   }
                //   if (!has_permission('access', 'read_product')) {
                //     $hide_colums .= "9,";
                //   }
                //   if (!has_permission('access', 'update_product')) {
                //     $hide_colums .= "10,";
                //   }
                //   if (!has_permission('access', 'create_purchase_invoice')) {
                //     $hide_colums .= "11,";
                //   }
                //   if (!has_permission('access', 'print_barcode')) {
                //     $hide_colums .= "12,";
                //   }
                //   if (!has_permission('access', 'delete_product')) {
                //     $hide_colums .= "13,";
                //   }
                // }

                ?>
                <div class="text-center">
                  <!-- <h4><?php echo trans('text_return_item'); ?></h4> -->
                </div>
                <div class="table-responsive">
                  <table id="product-college-list" class="table table-bordered table-striped table-hover" style="height:400px;">
                    <thead>
                      <tr class="bg-gray">
                        <th class="text-center w-10">Si/No</th>
                        <th class="w-20"><?php echo trans('label_product_name'); ?></th>
                        <th class="w-20"><?php echo trans('label_course'); ?></th>
                        <th class="text-center w-70"><?php echo trans('label_estimated_sales'); ?></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr ng-repeat="product_college in products">
                        <td class="text-center w-10 bg-gray">
                          <input type="hidden" name="product_college[{{ product_college.p_id }}][p_id]" value="{{ product_college.p_id }}">
                          <input type="checkbox" name="product_college[{{ product_college.p_id }}][check]" value="1" style="width:20px;height:20px;">
                        </td>
                        <td class="w-70">{{ product_college.p_name }}</td>
                        <td class="w-70">{{ product_college.course_name }} </td>
                        <td class="text-center w-20">
                          <input class="text-center" type="text" name="product_college[{{ product_college.p_id }}][item_quantity]" value="{{ product_college.estimatedsales }}" onclick="this.select();" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" onKeyUp="if(this.value<0){this.value='0';}">
                        </td>
                      </tr>
                      <!-- <tr>
                        <td colspan="4">
                          <textarea class="form-control no-resize" name="note" placeholder="<?php echo trans('placeholder_type_any_note'); ?>"></textarea>
                        </td>
                      </tr> -->
                    </tbody>
                  </table>
                </div>
                <!-- <table id="product-college-list" class="table table-bordered table-striped table-hover" data-hide-colums="<?php echo $hide_colums; ?>" data-print-columns="<?php echo $print_columns; ?>">
                  <thead>
                    <tr class="bg-gray">
                      <th class="w-1 product-head text-center">
                        <input type="checkbox" onclick="$('input[name*=\'select\']').prop('checked', this.checked);">
                      </th>
                      <th class="w-50">
                        <?/*php echo sprintf(trans('label_name'), null); */ ?>
                      </th>
                      <th class="w-10">
                        <?/*php echo sprintf(trans('label_course'), null); */ ?>
                      </th>              
                      <th class="w-15">
                        <?/*php echo trans('label_estimated_sales'); */ ?>
                      </th>                    
                    </tr>
                  </thead>
                  <tfoot>
                    <tr class="bg-gray">
                      <th class="w-5 product-head text-center">
                        <input type="checkbox" onclick="$('input[name*=\'select\']').prop('checked', this.checked);">
                      </th>
                      <th class="w-50">
                        <?/*php echo sprintf(trans('label_name'), null); */ ?>
                      </th>
                      <th class="w-10">
                        <?/*php echo sprintf(trans('label_course'), null); */ ?>
                      </th>                 
                      <th class="w-15">
                        <?/*php echo trans('label_estimated_sales'); */ ?>
                      </th>                     
                    </tr>
                  </tfoot>
                </table> -->
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

