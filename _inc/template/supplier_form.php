<h4 class="sub-title">
  <?php echo trans('text_update_title'); ?>
</h4>

<form class="form-horizontal" id="supplier-form" action="supplier.php" method="post">

  <input type="hidden" id="action_type" name="action_type" value="UPDATE">
  <input type="hidden" id="sup_id" name="sup_id" value="<?php echo $supplier['sup_id']; ?>">

  <div class="box-body">

    <div class="">
      <div class="col-sm-12">
        <label for="sup_name">
          <?php echo sprintf(trans('label_name'), null); ?><i class="required">*</i>
        </label>
        <input type="text" class="form-control" id="sup_name" ng-init="codeName='<?php echo $supplier['code_name'] ? $supplier['code_name'] : $supplier['sup_name']; ?>'" value="<?php echo $supplier['sup_name']; ?>" name="sup_name">
      </div>
    </div>

    <div class="">
      <div class="col-sm-6">
        <label for="sup_document">
          <?php echo trans('label_document'); ?><i class="required">*</i>
        </label>
        <input type="number" class="form-control" id="sup_document" name="sup_document" value="<?php echo $supplier['sup_document']; ?>">
      </div>
    </div>

    <div class="">
      <div class="col-sm-6">
        <label for="sup_mobile">
          <?php echo sprintf(trans('label_mobile'), null); ?><i class="required">*</i>
        </label>
        <input type="number" class="form-control" id="sup_mobile" value="<?php echo $supplier['sup_mobile']; ?>" name="sup_mobile">
      </div>
    </div>

    <div class="">
      <div class="col-sm-8">
        <label for="sup_email">
          <?php echo sprintf(trans('label_email'), null); ?><i class="required">*</i>
        </label>
        <input type="email" class="form-control" id="sup_email" value="<?php echo $supplier['sup_email']; ?>" name="sup_email">
      </div>
    </div>

    <div class="">
      <div class="col-sm-4">
        <label for="status">
          <?php echo trans('label_status'); ?><i class="required">*</i>
        </label>
        <select id="status" class="form-control" name="status">
          <option <?php echo isset($supplier['status']) && $supplier['status'] == '1' ? 'selected' : null; ?> value="1"><?php echo trans('text_active'); ?></option>
          <option <?php echo isset($supplier['status']) && $supplier['status'] == '0' ? 'selected' : null; ?> value="0"><?php echo trans('text_in_active'); ?></option>
        </select>
      </div>
    </div>

    <div class="">
      <div class="col-sm-12">
        <label for="sup_address">
          <?php echo sprintf(trans('label_address'), null); ?><i class="required">*</i>
        </label>
        <textarea class="form-control" id="sup_address" name="sup_address"><?php echo $supplier['sup_address']; ?></textarea>
      </div>
    </div>

    <div class="col-sm-12 store-selector">
      <label>
        <?php echo trans('label_store'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-12 store-selector">
        <div class="checkbox selector">
          <label>
            <input type="checkbox" onclick="$('input[name*=\'supplier_store\']').prop('checked', this.checked);"> Seleccionar / Deseleccionar
          </label>
        </div>
        <div class="filter-searchbox">
          <input ng-model="search_store" class="form-control" type="text" id="search_store" placeholder="<?php echo trans('search'); ?>">
        </div>
        <div class="well well-sm store-well">
          <div filter-list="search_store">
            <?php foreach (get_stores() as $the_store) : ?>
              <div class="checkbox">
                <label>
                  <input type="checkbox" name="supplier_store[]" value="<?php echo $the_store['store_id']; ?>" <?php echo in_array($the_store['store_id'], $supplier['stores']) ? 'checked' : null; ?>>
                  <?php echo $the_store['name']; ?>
                </label>
              </div>
            <?php endforeach; ?>
          </div>
        </div>
      </div>
    </div>




    <div class="form-group hidden">
      <label for="code_name">
        <?php echo trans('label_code_name'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="code_name" value="<?php echo $supplier['code_name'] ? $supplier['code_name'] : "{{ codeName | strReplace:' ':'_' | lowercase }}"; ?>" name="code_name" required>
      </div>
    </div>






    <?php if (get_preference('invoice_view') == 'indian_gst') : ?>
      <div class="form-group hidden">
        <label for="gtin">
          <?php echo trans('label_gtin'); ?>
        </label>
        <div class="col-sm-8">
          <input type="text" class="form-control" id="gtin" name="gtin" value="<?php echo $supplier['gtin']; ?>">
        </div>
      </div>
    <?php endif; ?>



    <div class="form-group hidden">
      <label for="sup_city">
        <?php echo sprintf(trans('label_city'), null); ?>
      </label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="sup_city" value="<?php echo $supplier['sup_city']; ?>" name="sup_city">
      </div>
    </div>

    <?php if (get_preference('invoice_view') == 'indian_gst') : ?>
      <div class="form-group hidden">
        <label for="sup_state">
          <?php echo sprintf(trans('label_state'), null); ?>
        </label>
        <div class="col-sm-8">
          <?php echo stateSelector($supplier['sup_state'], 'sup_state', 'sup_state'); ?>
        </div>
      </div>
    <?php else : ?>
      <div class="form-group hidden">
        <label for="sup_state">
          <?php echo sprintf(trans('label_state'), null); ?>
        </label>
        <div class="col-sm-8">
          <input type="text" class="form-control" id="sup_state" value="<?php echo $supplier['sup_state']; ?>" name="sup_state">
        </div>
      </div>
    <?php endif; ?>

    <div class="form-group hidden">
      <label for="country">
        <?php echo trans('label_country'); ?>
      </label>
      <div class="col-sm-8">
        <?php echo countrySelector($supplier['sup_country'], 'sup_country', 'sup_country'); ?>
      </div>
    </div>



    <div class="form-group hidden">
      <label for="sup_details">
        <?php echo sprintf(trans('label_details'), null); ?>
      </label>
      <div class="col-sm-8">
        <textarea class="form-control" id="sup_details" name="sup_details"><?php echo $supplier['sup_details']; ?></textarea>
      </div>
    </div>



    <div class="form-group hidden">
      <label for="sort_order">
        <?php echo sprintf(trans('label_sort_order'), null); ?><i class="required">*</i>
      </label>
      <div class="col-sm-8">
        <input type="number" class="form-control" id="sort_order" value="<?php echo $supplier['sort_order']; ?>" name="sort_order">
      </div>
    </div>

    <div class="">
      <label for="supplier_address"></label>
      <div class="col-sm-8">
        <button id="supplier-update" data-form="#supplier-form" data-datatable="#supplier-supplier-list" class="btn btn-info" name="btn_edit_supplier" data-loading-text="Actualizando Espera..!">
          <span class="fa fa-fw fa-pencil"></span>
          <?php echo sprintf(trans('button_update'), null); ?>
        </button>
      </div>
    </div>

  </div>
</form>