<form id="form-transfer" class="form-horizontal" action="banking.php" method="post">
  <input type="hidden" id="action_type" name="action_type" value="TRANSFER">  
  <div class="box-body">
    <div class="form-group">
      <label for="from_account_id" class="col-sm-3 control-label">
        <?php echo trans('label_from'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <select id="from_account_id" class="form-control" name="from_account_id" >
          <option value="">
            <?php echo trans('text_select'); ?>
          </option>
          <?php foreach (get_bank_accounts() as $account): $balance = get_the_account_balance($account['id']); 
            if ($balance <= 0) continue;?>
            <option value="<?php echo $account['id'];?>">
              <?php echo $account['account_name']; ?> (<?php echo currency_format($balance);?>)
            </option>
          <?php endforeach; ?>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label for="to_account_id" class="col-sm-3 control-label">
        <?php echo trans('label_to'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <select id="to_account_id" class="form-control" name="to_account_id" >
          <option value="">
            <?php echo trans('text_select'); ?>
          </option>
          <?php foreach (get_bank_accounts() as $account): ?>
            <option value="<?php echo $account['id'];?>">
              <?php echo $account['account_name']; ?> (<?php echo currency_format(get_the_account_balance($account['id']));?>)
            </option>
          <?php endforeach; ?>
        </select>
      </div>
    </div>
    <div class="form-group">
      <?php $ref_no = isset($invoice['ref_no']) ? $invoice['ref_no'] : null; ?>
      <label for="ref_no" class="col-sm-3 control-label">
          <?php echo trans('label_ref_no'); ?> 
          <span data-toggle="tooltip" title="" data-original-title="e.g. Transaction ID, Check No."></span>
      </label>
      <div class="col-sm-7">
        <input type="text" class="form-control" id="ref_no" value="<?php echo $ref_no; ?>" name="ref_no" <?php echo $ref_no ? 'readonly' : null; ?> autocomplete="off">
      </div>
    </div>
    <div class="form-group">
      <label for="title" class="col-sm-3 control-label">
        <?php echo trans('label_about'); ?>
      </label>
      <div class="col-sm-7">
        <input type="text" id="title" class="form-control" name="title">
      </div>
    </div>
    <div class="form-group">
      <label for="amount" class="col-sm-3 control-label">
        <?php echo trans('label_amount'); ?>
       </label>
      <div class="col-sm-7">
        <input type="text" id="amount" class="form-control" name="amount" onclick="this.select();" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" onKeyUp="if(this.value<0){this.value='1';}">
      </div>
    </div>
    <div class="form-group">
      <label for="details" class="col-sm-3 control-label">
        <?php echo trans('label_details'); ?>
      </label>
      <div class="col-sm-7">
        <textarea name="details" id="details" class="form-control"><?php echo isset($invoice) ? $invoice['details'] : null; ?></textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label"></label>
      <div class="col-sm-7">            
        <button id="transfer-confirm-btn" class="btn btn-info" data-form="#form-transfer" data-datatable="#invoice-invoice-list" name="submit" data-loading-text="Procesando...">
          <i class="fa fa-fw fa-plus"></i>
          <?php echo trans('button_transfer_now'); ?>
        </button>
      </div>
    </div>
  </div>
</form>