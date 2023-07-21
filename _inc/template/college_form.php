<h4 class="sub-title">
  <?php echo trans('text_update_title'); ?>
</h4>
<form class="form-horizontal" id="college-form" action="college.php" method="post">
  <input type="hidden" id="action_type" name="action_type" value="UPDATE">
  <input type="hidden" id="college_id" name="college_id" value="<?php echo $college['college_id']; ?>">
  <div class="box-body">

    <div class="nav-tabs-custom">
      <ul class="nav nav-tabs">
        <li class="active">
          <a href="#general" data-toggle="tab" aria-expanded="false">
            <?php echo trans('text_general'); ?>
          </a>
        </li>
        <li class="">
          <a href="#product-setting" data-toggle="tab" aria-expanded="false">
            <?php echo trans('text_product_setting'); ?>
          </a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="general">

          <div class="form-group hidden">
            <label class="col-sm-3 control-label">
              <?php echo sprintf(trans('label_image'), null); ?>
            </label>
            <div class="col-sm-2">
              <div class="preview-thumbnail">
                <a ng-click="POSFilemanagerModal({target:'the_college_image',thumb:'college_thumb'})" onClick="return false;" href="" data-toggle="image" id="college_thumb">
                  <?php if (isset($college['college_image']) && ((FILEMANAGERPATH && is_file(FILEMANAGERPATH . $college['college_image']) && file_exists(FILEMANAGERPATH . $college['college_image'])) || (is_file(DIR_STORAGE . 'categories' . $college['college_image']) && file_exists(DIR_STORAGE . 'categories' . $college['college_image'])))) : ?>
                    <img src="<?php echo FILEMANAGERURL ? FILEMANAGERURL : root_url() . '/storage/categories'; ?>/<?php echo $college['college_image']; ?>">
                  <?php else : ?>
                    <img src="../assets/das/img/noimage.jpg">
                  <?php endif; ?>
                </a>
                <input type="hidden" name="college_image" id="the_college_image" value="<?php echo isset($college['college_image']) ? $college['college_image'] : null; ?>">
              </div>
            </div>
          </div>

          <div class="form-group">
            <label for="college_name" class="col-sm-3 control-label">
              <?php echo sprintf(trans('label_name'), null); ?><i class="required">*</i>
            </label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="college_name" value="<?php echo $college['college_name']; ?>" name="college_name" ng-init="codeName='<?php echo $college['code_name'] ? $college['code_name'] : $college['college_name']; ?>'" value="<?php echo $college['college_name']; ?>" required>
            </div>
          </div>

          <div class="form-group hidden">
            <label for="code_name" class="col-sm-3 control-label">
              <?php echo trans('label_code_name'); ?><i class="required">*</i>
            </label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="code_name" value="<?php echo $college['code_name'] ? $college['code_name'] : "{{ codeName | strReplace:' ':'_' | lowercase }}"; ?>" name="code_name" required>
            </div>
          </div>

          <!-- <div class="form-group">
            <label class="col-sm-3 control-label">
              <?/*php echo trans('label_store'); */ ?><i class="required">*</i>
            </label>
            <div class="col-sm-8 store-selector">
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
                        <input type="checkbox" name="college_store[]" value="<?/*php echo $the_store['store_id']; */ ?>" <?/*php echo in_array($the_store['store_id'], $college['stores']) ? 'checked' : null; */ ?>>
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
              <?php echo sprintf(trans('label_details'), null); ?>
            </label>
            <div class="col-sm-8">
              <textarea class="form-control" id="college_details" name="college_details"><?php echo $college['college_details']; ?></textarea>
            </div>
          </div>

          <div class="form-group">
            <label for="status" class="col-sm-3 control-label">
              <?php echo trans('label_status'); ?><i class="required">*</i>
            </label>
            <div class="col-sm-8">
              <select id="status" class="form-control" name="status">
                <option <?php echo isset($college['status']) && $college['status'] == '1' ? 'selected' : null; ?> value="1"><?php echo trans('text_active'); ?></option>
                <option <?php echo isset($college['status']) && $college['status'] == '0' ? 'selected' : null; ?> value="0"><?php echo trans('text_in_active'); ?></option>
              </select>
            </div>
          </div>

          <!-- <div class="form-group">
            <label for="sort_order" class="col-sm-3 control-label">
              <?/*php echo sprintf(trans('label_sort_order'), null); */ ?><i class="required">*</i>
            </label>
            <div class="col-sm-8">
              <input type="number" class="form-control" id="sort_order" value="<?/*php echo $college['sort_order']; */ ?>" name="sort_order">
            </div>
          </div> -->

        </div>

           <div class="tab-pane" id="product-setting">
          <div class="form-group">
            <div class="input-group wide-tip">
              <div class="input-group-addon paddinglr-10">
                <i class="fa fa-barcode addIcon fa-2x"></i>
              </div>
              <input type="text" name="add_item_edit" value="" class="form-control input-lg autocomplete-product-edit" id="add_item_edit" data-type="p_name" onkeypress="return event.keyCode != 13;" onclick="this.select();" placeholder="<?php echo trans('placeholder_search_product'); ?>" autocomplete="off" tabindex="1">
            </div>

            <h4>
              <b><i><?php echo trans('text_items_list_select'); ?></i></b>
            </h4>
            <div class="row">
              <div class="col-md-12">
                <div class="table-responsive">
                  <table id="product-edit-table" class="table table-striped table-bordered mb-0">
                    <thead>
                      <tr class="bg-info">
                        <th class="w-55 text-center">
                          <?php echo trans('label_product_name'); ?>
                        </th>
                        <th class="w-15 text-center">
                          <?php echo trans('label_estimated_sales'); ?>
                        </th>
                        <th class="w-5 text-center">
                          <i class="fa fa-trash-o"></i>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <!-- <tfoot>

                      <tr class="bg-gray hidden">
                        <th class="text-right" colspan="6">
                          <?php echo trans('label_subtotal'); ?>
                        </th>
                        <th class="col-sm-2 text-right">
                          <input id="total-tax" type="hidden" name="total-tax" value="">
                          <input id="total-amount" type="hidden" name="total-amount" value="">
                          <span id="total-amount-view">0.00</span>
                        </th>
                        <th class="w-25p">&nbsp;</th>
                      </tr>
                      <tr class="bg-gray hidden">
                        <th class="text-right" colspan="6">
                          <?php echo trans('label_order_tax'); ?> (%)
                        </th>
                        <th class="col-sm-2 text-right">
                          <input ng-change="addOrderTax();" id="order-tax" class="text-right p-5" type="taxt" name="order-tax" ng-model="orderTax" onclick="this.select();" ondrop="return false;" onkeypress="return IsNumeric(event);" onpaste="return false;" autocomplete="off">
                        </th>
                        <th class="w-25p">&nbsp;</th>
                      </tr>
                      <tr class="bg-gray hidden">
                        <th class="text-right" colspan="6">
                          <?php echo trans('label_shipping_charge'); ?>
                        </th>
                        <th class="col-sm-2 text-right">
                          <input ng-change="addShippingAmount();" id="shipping-amount" class="text-right p-5" type="taxt" name="shipping-amount" ng-model="shippingAmount" onclick="this.select();" ondrop="return false;" onkeypress="return IsNumeric(event);" onpaste="return false;" autocomplete="off">
                        </th>
                        <th class="w-25p">&nbsp;</th>
                      </tr>
                      <tr class="bg-gray hidden">
                        <th class="text-right" colspan="6">
                          <?php echo trans('label_others_charge'); ?>
                        </th>
                        <th class="col-sm-2 text-right">
                          <input ng-change="addOthersCharge();" id="others-charge" class="text-right p-5" type="taxt" name="others-charge" ng-model="othersCharge" onclick="this.select();" ondrop="return false;" onkeypress="return IsNumeric(event);" onpaste="return false;" autocomplete="off">
                        </th>
                        <th class="w-25p">&nbsp;</th>
                      </tr>
                      <tr class="bg-gray hidden">
                        <th class="text-right" colspan="6">
                          <?php echo trans('label_discount_amount'); ?>
                        </th>
                        <th class="col-sm-2 text-right">
                          <input ng-change="addDiscountAmount();" id="discount-amount" class="text-right p-5" type="taxt" name="discount-amount" ng-model="discountAmount" onclick="this.select();" ondrop="return false;" onkeypress="return IsNumeric(event);" onpaste="return false;" autocomplete="off">
                        </th>
                        <th class="w-25p">&nbsp;</th>
                      </tr>
                      <tr class="bg-yellow hidden">
                        <th class="text-right" colspan="6">
                          <?php echo trans('label_payable_amount'); ?>
                        </th>
                        <th class="col-sm-2 text-right">
                          <input type="hidden" name="payable-amount" value="{{ payableAmount }}">
                          <h4 class="text-center"><b>{{ payableAmount | formatDecimal:2 }}</b></h4>
                        </th>
                        <th class="w-25p">&nbsp;</th>
                      </tr>
                      <tr class="bg-blue hidden">
                        <th class="text-right" colspan="6">
                          <?php echo trans('label_payment_method'); ?>
                        </th>
                        <th class="col-sm-2 text-center">
                          <select id="pmethod-id" class="form-control select2" name="pmethod-id">
                          
                          </select>
                        </th>
                        <th class="w-25p">&nbsp;</th>
                      </tr>
                      <tr class="bg-blue hidden">
                        <th class="text-right" colspan="6">
                          <?php echo trans('label_paid_amount'); ?>
                        </th>
                        <th class="col-sm-2 text-right">
                          <input ng-change="addPaidAmount();" id="paid-amount" class="text-center paidAmount" type="taxt" name="paid-amount" ng-model="paidAmount" onclick="this.select();" ondrop="return false;" onkeypress="return IsNumeric(event);" onpaste="return false;" autocomplete="off">
                        </th>
                        <th class="w-25p">&nbsp;</th>
                      </tr>

                      <tr class="bg-gray hidden">
                        <th colspan="2" class="w-10 text-right">
                          <?php echo trans('label_due_amount'); ?>
                        </th>
                        <th colspan="4" class="w-70 bg-red text-center">
                          <input type="hidden" name="due-amount" value="{{ dueAmount }}">
                          <span>{{ dueAmount | formatDecimal:2 }}</span>
                        </th>
                        <th colspan="2">&nbsp;</th>
                      </tr>
                      <tr class="bg-gray hidden">
                        <th colspan="2" class="w-10 text-right">
                          <?php echo trans('label_change_amount'); ?>
                        </th>
                        <th colspan="4" class="w-70 bg-green text-center">
                          <input type="hidden" name="change-amount" value="{{ changeAmount }}">
                          <span>{{ changeAmount | formatDecimal:2 }}</span>
                        </th>
                        <th colspan="2">&nbsp;</th>
                      </tr>
                    </tfoot> -->
                  </table>
                </div>
              </div>
            </div>
            <!-- <table style="margin-bottom:0;" class="table table-striped table-bordered mb0">
              <thead>
                <tr class="bg-gray">
                  <th class="w-45 text-center" style="padding:8px;"><?php echo trans('label_product_name'); ?></th>
                  <th class="w-15 text-center" style="padding:8px;"><?php echo trans('label_estimated_sales'); ?></th>
                  <th class="w-5 text-center" style="padding:8px;"><span class="fa fa-trash"></span></th>
                </tr>
              </thead>
            </table>
            <div class="well well-sm product-well" style="padding:0;margin-bottom:0;">
              <table class="table table-striped table-bordered">
                <tbody>
                  <tr class="info" ng-repeat="product_college in products">
                    <td class="w-45">{{ product_college.p_name }}</td>
                    <td class="w-15 text-center">
                      <input id="item_quantity-{{ product_college.p_id }}" class="form-control text-center quantity" type="text" name="product_college[{{ product_college.p_id }}][item_quantity]" value="{{ product_college.estimatedsales }}" onclick="this.select();" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" onKeyUp="if(this.value<0){this.value='0';}">
                    </td>
                    <td class="w-5 text-center text-red">
                      <span ng-click="removeItemFromList($index, product_college.p_id)" class="fa fa-close pointer"></span>
                    </td>
                  </tr>

                </tbody>
              </table>
            </div> -->

          </div>
        </div>

        <!-- <div class="tab-pane" id="product-setting">
          <div class="form-group">
            <label class="col-sm-3 control-label"></label>
            <div class="col-sm-12 product-selector">
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
                        <input type="checkbox" name="product_college[]" value="<?/*php echo $the_store['p_id']; */ ?>" <?/*php echo in_array($the_store['p_id'], get_product_store_college($college['college_id'])) ? 'checked' : null; */ ?>>
                        <?/*php echo $the_store['p_name'] . ' [ Curso: ' . $the_store['course_name'] . ' ]'; */ ?>
                      </label>
                    </div>
                  <?/*php endforeach; */ ?>

                </div>
              </div>
            </div>
          </div>
        </div> -->
      </div>
    </div>

    <div class="box-footer">

      <div class="form-group">
        <label for="college_address" class="col-sm-3 control-label"></label>
        <div class="col-sm-8">
          <button id="college-update" data-form="#college-form" data-datatable="#college-college-list" class="btn btn-info" name="btn_edit_college" data-loading-text="Actualizando Espera..!">
            <span class="fa fa-fw fa-pencil"></span>
            <?php echo sprintf(trans('button_update'), null); ?>
          </button>
        </div>
      </div>

    </div>

  </div>
</form>