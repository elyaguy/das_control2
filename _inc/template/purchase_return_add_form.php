<form id="form-transfer" class="form-horizontal" action="purchase_return_all.php" method="post">
  <input type="hidden" id="action_type" name="action_type" value="RETURN">
  <div class="box-body">
    <div class="form-group hidden">
      <label for="image" class="col-sm-3 control-label">
        <?php echo trans('label_attachment'); ?>
      </label>
      <div class="col-sm-7">
        <div class="preview-thumbnail">
          <a ng-click="POSFilemanagerModal({target:'image',thumb:'image_thumb'})" onClick="return false;" href="#" data-toggle="image" id="image_thumb">
            <img src="../assets/das/img/noimage.jpg">
          </a>
          <input type="hidden" name="image" id="image" value="">
        </div>
      </div>
    </div> 
    <div class="form-group">
      <label for="note" class="col-sm-3 control-label">
        <?php echo trans('label_note'); ?>
      </label>
      <div class="col-sm-7">
        <textarea name="note" id="note" class="form-control"></textarea>
      </div>
    </div>


    <div class="box-body">
      <div class="col-sm-6" style="padding:0;">
        <h4>
          <b><i><?php echo trans('text_stock_list'); ?></i></b>
        </h4>
        <div class="filter-searchbox">
          <input ng-model="search_list" class="form-control" type="text" placeholder="<?php echo trans('search'); ?>">
        </div>
        <div class="well well-sm product-well">
          <div filter-list="search_list">
            <div class="stock-item" ng-repeat="product in productsArray" ng-click="addItemToTransferList(product.id, 1);" id="stock-item-{{ product.id }}" style="cursor:pointer;padding:5px 0;border-bottom: 1px dotted #ccc;">
              -- {{ product.item_name }}, <?php echo trans('text_invoice_id'); ?>: {{ product.invoice_id}}, <?php echo trans('text_stock'); ?>: <span class="badge badge-info">{{ product.quantity }}</span>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <h4>
          <b><i><?php echo trans('text_purchase_return_list'); ?></i></b>
        </h4>
        <table style="margin-bottom:0;" class="table table-striped table-bordered mb0">
          <thead>
            <tr class="bg-gray">
              <th class="w-45 text-center" style="padding:8px;"><?php echo trans('label_item_name'); ?></th>
              <th class="w-25 text-center" style="padding:8px;"><?php echo trans('label_invoice_id'); ?></th>
              <th class="w-25 text-center" style="padding:8px;"><?php echo trans('label_transfer_qty'); ?></th>
              <th class="w-5 text-center" style="padding:8px;"><span class="fa fa-trash"></span></th>
            </tr>
          </thead>
        </table>
        <div class="well well-sm product-well" style="padding:0;margin-bottom:0;">
          <table class="table table-striped table-bordered">
            <tbody>
              <tr class="info" ng-repeat="transferItem in transferItemArray">
                <td class="w-45" style="">{{ transferItem.item_name }}</td>
                <td class="w-25 text-center">{{ transferItem.invoice_id }}</td>
                <td class="w-25 text-center">
                  <input id="id-{{ transferItem.id }}" type="hidden" name="items[{{ transferItem.id }}][id]" value="{{ transferItem.id }}">
                  <input id="quantity-{{ transferItem.id }}" class="form-control text-center quantity" type="text" name="items[{{ transferItem.id }}][quantity]" value="{{ transferItem.quantity }}" onClick="this.select();">
                </td>
                <td class="w-5 text-center text-red">
                  <span ng-click="removeItemFromList($index, transferItem.id)" class="fa fa-close pointer"></span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-5 col-sm-offset-2 text-center">
        <button id="transfer-confirm-btn" class="btn btn-block btn-lg btn-info r-50" data-form="#form-transfer" data-datatable="#transter-transter-list" name="submit" data-loading-text="Procesando...">
          <span class="fa fa-fw fa-car"></span><?php echo trans('button_return_now'); ?> &rarr;
        </button>
      </div>
      <div class="col-sm-3">
        <button type="reset" class="btn btn-warning btn-block" id="reset" name="reset">
          <span class="fa fa-circle-o"></span>
          <?php echo trans('button_reset'); ?></button>
      </div>
    </div>
  </div>
</form>