<?php 
ob_start();
session_start();
include ("../_init.php");

// redirect, if user not logged in
if (!is_loggedin()) {
  redirect(store('base_url') . '/index.php?redirect_to=' . url());
}

// redirect, user haven't read permission
if (user_group_id() != 1 && !has_permission('access', 'read_purchase_return')) {
  redirect(store('base_url') . '/admin/dashboard.php');
}

$type = isset($request->get['type']) ? $request->get['type'] : 'purchase_return';

// Set Document Title
$document->setTitle(trans('title_'.$type));

// Add Script
$document->addScript('../assets/das/angular/modals/PurchaseReturnAllViewModal.js');
// $document->addScript('../assets/das/angular/modals/PurchaseReturnAllEditModal.js');
$document->addScript('../assets/das/angular/controllers/PurchaseReturnAllController.js');

include("header.php"); 
include ("left_sidebar.php");
?>

<!-- content wrapper start -->
<div class="content-wrapper" ng-controller="PurchaseReturnAllController">

  <!-- content header start -->
  <section class="content-header">
    <?php include ("../_inc/template/partials/apply_filter.php"); ?>
    <h1>
      <?php echo trans('text_stock_'.$type.'_title'); ?>
      <small>
        <?php echo store('name'); ?>
      </small>
    </h1>
    <ol class="breadcrumb">
      <li>
        <a href="dashboard.php">
          <i class="fa fa-dashboard"></i> 
          <?php echo trans('text_dashboard'); ?>
        </a>
      </li>
      <li class="active">
        <?php echo trans('text_'.$type.'_title'); ?>
      </li>
    </ol>
  </section>
  <!-- content header end -->

  <!-- content start -->
  <section class="content">

    <?php if ($type == 'purchase_return'):?>
    <?php if (user_group_id() == 1 || has_permission('access', 'add_purchase_return')) : ?>
      <div class="box box-info<?php echo create_box_state(); ?>">
        <div class="box-header with-border">
          <h3 class="box-title">
            <span class="fa fa-fw fa-plus"></span> <?php echo trans('text_add_purchase_return_title'); ?>
          </h3>
          <button type="button" class="btn btn-box-tool add-new-btn" data-widget="collapse" data-collapse="true">
            <i class="fa <?php echo !create_box_state() ? 'fa-minus' : 'fa-plus'; ?>"></i>
          </button>
        </div>
        <?php include('../_inc/template/purchase_return_add_form.php'); ?>
      </div>
    <?php endif; ?>
    <?php endif;?>

    <div class="row">
      <div class="col-xs-12">
        <div class="box box-success">
          <div class="box-header">
            <h3 class="box-title">
              <?php echo trans('text_purchase_return_list_title'); ?>
            </h3>
          </div>
          <div class='box-body'>     
            
            <div class="table-responsive"> 
              <?php
              $hide_colums = "5,6";
              ?>  
              <table id="invoice-invoice-list"  class="table table-bordered table-striped table-hover" data-hide-colums="<?php echo $hide_colums; ?>">
                <thead>
                  <tr class="bg-gray">
                    <th class="w-10">
                      <?php echo trans('label_datetime'); ?>
                    </th>
                    <th class="w-10">
                      <?php echo trans('label_reference_no'); ?>
                    </th>
                    <th class="w-10">
                      <?php echo trans('label_supplier'); ?>
                    </th>
                    <th class="w-10">
                      <?php echo trans('label_amount'); ?> 
                    </th>
                    <th class="w-5">
                      <?php echo trans('label_view'); ?>
                    </th>
                    <th class="w-5">
                      <?php echo trans('label_edit'); ?>
                    </th>
                    <th class="w-5">
                      <?php echo trans('label_delete'); ?>
                    </th>
                  </tr>
                </thead>
                <tfoot>
                  <tr class="bg-gray">
                    <th class="w-10">
                      <?php echo trans('label_datetime'); ?>
                    </th>
                    <th class="w-10">
                      <?php echo trans('label_reference_no'); ?>
                    </th>
                    <th class="w-10">
                      <?php echo trans('label_supplier'); ?>
                    </th>
                    <th class="w-10">
                      <?php echo trans('label_amount'); ?> 
                    </th>
                    <th class="w-5">
                      <?php echo trans('label_view'); ?>
                    </th>
                    <th class="w-5">
                      <?php echo trans('label_edit'); ?>
                    </th>
                    <th class="w-5">
                      <?php echo trans('label_delete'); ?>
                    </th>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- content end -->
</div>
<!-- content wrapper end -->

<?php include ("footer.php"); ?>