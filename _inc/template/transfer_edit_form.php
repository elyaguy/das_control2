<form id="transfer-edit-form" class="form-horizontal" action="transfer.php" method="post">
  <input type="hidden" id="action_type" name="action_type" value="UPDATE">  
  <input type="hidden" id="id" name="id" value="<?php echo $transfer['id'];?>">  
  <div class="box-body">
    <div class="form-group">
      <label for="status" class="col-sm-3 control-label">
        <?php echo trans('label_status'); ?><i class="required">*</i>
      </label>
      <div class="col-sm-7">
        <select id="status" class="form-control" name="status" >
            <option value="pending" <?php echo $transfer['status'] == 'pending' ? 'selected' : null; ?>><?php echo trans('text_pending'); ?></option>
            <option value="sent" <?php echo $transfer['status'] == 'sent' ? 'selected' : null; ?>><?php echo trans('text_sent'); ?></option>
            <option value="complete" <?php echo $transfer['status'] == 'complete' ? 'selected' : null; ?>><?php echo trans('text_complete'); ?></option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label for="transfer-update" class="col-sm-3 control-label"></label>
      <div class="col-sm-8">            
        <button id="transfer-update" class="btn btn-info"  data-form="#transfer-edit-form" data-datatable="#transfer-transfer-list" name="transfer-update" data-loading-text="Actualizando Espera..!">
          <i class="fa fa-fw fa-pencil"></i> <?php echo trans('button_update'); ?>
        </button>
      </div>
    </div>
  </div>
</form>