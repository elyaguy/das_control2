<?php 
ob_start();
session_start();
include ("../_init.php");

// Redirect, If user is not logged in
if (!is_loggedin()) {
  redirect(root_url() . '/index.php?redirect_to=' . url());
}

// Redirect, If User has not Read Permission
if (user_group_id() != 1 && !has_permission('access', 'read_college_profile')) {
  redirect(root_url() . '/'.ADMINDIRNAME.'/dashboard.php');
}

// SUPPLIER MODEL
$college_model = registry()->get('loader')->model('college');

// FETCH SUPPLIER INFO   
$college_id = isset($request->get['college_id']) ? $request->get['college_id'] : '';
$college = $college_model->getCollege($college_id); 
if (count($college) <= 1) {
  redirect(root_url() . '/'.ADMINDIRNAME.'/college.php');
}

// Set Document Title
$document->setTitle(trans('title_college_profile'));

// Add Script
$document->addScript('../assets/das/angular/controllers/CollegeProfileController.js');
if (user_group_id() == 1 || has_permission('access', 'read_sell_report')) {
  $document->addScript('../assets/das/angular/controllers/ReportCollegeSellController.js');
}

// ADD BODY CLASS
$document->setBodyClass('sidebar-collapse college-profile');

// Include Header and Footer
include("header.php"); 
include ("left_sidebar.php");
?>

<script type="text/javascript">
  var college = <?php echo json_encode($college); ?>
</script>

<!-- Content Wrapper Start -->
<div class="content-wrapper">

  <!-- Content Header Start -->
  <section class="content-header">
    <?php include ("../_inc/template/partials/apply_filter.php"); ?>
    <h1>
      <?php echo sprintf(trans('text_college_profile_title'), ucfirst($college['college_name'])); ?>
    </h1>
    <ol class="breadcrumb">
      <li>
        <a href="dashboard.php">
          <i class="fa fa-dashboard"></i> 
          <?php echo trans('text_dashboard'); ?>
        </a>
      </li>
      <li>
        <a href="college.php">
          <?php echo trans('text_colleges'); ?>
        </a>
        </li>
      <li class="active">
        <?php echo ucfirst($college['college_name']); ?>
      </li>
    </ol>
  </section>
  <!-- Content Header End -->
  
  <!-- Content Start -->
  <section class="content">

    <?php if(DEMO) : ?>
    <div class="box">
      <div class="box-body">
        <div class="alert alert-info mb-0">
          <p><span class="fa fa-fw fa-info-circle"></span> <?php echo $demo_text; ?></p>
        </div>
      </div>
    </div>
    <?php endif; ?>
    
    <div class="row profile-heading">
      <div class="col-sm-4 col-xs-12">
        <div class="box box-widget widget-user">
          <div class="widget-user-header bg-<?php echo $user->getPreference('base_color', 'black'); ?>">
            <h3 class="widget-user-username">
              <?php echo ucfirst($college['college_name']); ?>
            </h3>
            <h5 class="widget-user-desc">
              <?php echo trans('text_since'); ?>: <?php echo format_date($college['created_at']); ?>
            </h5>
          </div>
          <div class="widget-user-image">
            <svg class="svg-icon"><use href="#icon-avatar-college"></svg>
          </div>
          <div class="box-footer">
            <div class="row">
              <div class="col-md-6 border-right">
                <div class="description-block">
                  <a id="edit-college" class="btn btn-block btn-primary" href="product.php?college_id=<?php echo $college['college_id']; ?>" title="<?php echo trans('text_college_products'); ?>">
                    <i class="fa fa-fw fa-list"></i> <?php echo trans('button_all_products'); ?>
                  </a>
                </div>
              </div>
              <div class="col-md-6">
                <div class="description-block">
                  <a id="edit-college" class="btn btn-block btn-warning" href="college.php?college_id=<?php echo $college['college_id']; ?>&amp;college_name=<?php echo $college['college_name']; ?>" title="<?php echo trans('button_edit'); ?>">
                    <i class="fa fa-fw fa-edit"></i> <?php echo trans('button_edit'); ?>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-5 contact">
        <div class="box box-info">
          <div class="box-header with-border text-center">
            <h3 class="box-title">
              <?php echo trans('text_contact_information'); ?>
            </h3>
          </div>
          <div class="box-body">
            <div class="well text-center">
              <address>
                <?php if ($college['college_details']) : ?>
                  <h4>
                    <strong>
                      <?php echo trans('label_details'); ?>:
                    </strong>
                    <?php echo limit_char($college['college_details'], 100); ?>
                  </h4>
                <?php endif; ?>
              </address>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-3 balance">
        <div class="info-box">
          <span class="info-box-icon bg-<?php echo $user->getPreference('base_color', 'black'); ?>">
            <i>
              <?php echo get_currency_symbol(); ?>
            </i>
          </span>
          <div class="info-box-content"><h4><?php echo trans('text_total_sell'); ?></h4>
            <span class="info-box-number">
              <?php echo currency_format($college_model->totalSell($college_id, from(), to())); ?>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12">

        <div class="nav-tabs-custom">
          <ul class="nav nav-tabs">
            <?php if (user_group_id() == 1 || has_permission('access', 'read_sell_report')) : ?>
            <li class="active">
              <a href="#sells" data-toggle="tab" aria-expanded="false">
                <?php echo trans('text_sells'); ?>
              </a>
            </li>
            <?php endif; ?>
            <li class="pull-right">
              <div class="box-tools">
                <div class="btn-group">
                  <a type="button" class="btn btn-info" href="purchase_log.php?college_id=<?php echo $college['college_id'];?>"><span class="fa fa-fw fa-list"></span> <?php echo trans('button_transaction_list'); ?></a>
                </div>
              </div>
            </li>
          </ul>
          <div class="tab-content">
            <?php if (user_group_id() == 1 || has_permission('access', 'read_sell_report')) : ?>
            <div class="tab-pane active" id="sells">
              <div class="box box-success" ng-controller="ReportCollegeSellController">
                <div class="box-header">
                  <h3 class="box-title">
                    <?php echo trans('text_selling_invoice_list'); ?>
                  </h3>
                  <div class="box-tools">
                    <div class="btn-group" style="max-width:280px;">
                      <div class="input-group">
                        <div class="input-group-addon no-print" style="padding: 2px 8px; border-right: 0;">
                          <i class="fa fa-users" id="addIcon" style="font-size: 1.2em;"></i>
                        </div>
                        <select id="college_id" class="form-control" name="college_id" >
                          <option value=""><?php echo trans('text_select'); ?></option>
                          <?php foreach (get_colleges() as $the_supploier) : ?>
                            <option value="<?php echo $the_supploier['college_id'];?>">
                            <?php echo $the_supploier['college_name'];?>
                          </option>
                        <?php endforeach;?>
                        </select>
                        <div class="input-group-addon no-print" style="padding: 2px 8px; border-left: 0;">
                          <i class="fa fa-search" id="addIcon" style="font-size: 1.2em;"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="box-body">
                  <div class="table-responsive">  
                    <?php
                      $print_columns = '0,1,2,3,4,5,6,7,8';
                      if (user_group_id() != 1) {
                        if (! has_permission('access', 'show_purchase_price')) {
                          $print_columns = str_replace('4,', '', $print_columns);
                        }
                        if (! has_permission('access', 'show_profit')) {
                          $print_columns = str_replace(',8', '', $print_columns);
                        }
                      }
                      $hide_colums = "3,";
                      if (user_group_id() != 1) {
                        if (! has_permission('access', 'view_purchase_price')) {
                          $hide_colums .= "4,";
                        }
                        if (! has_permission('access', 'view_profit')) {
                          $hide_colums .= "8,";
                        }
                      }
                    ?>
                    <table id="report-report-list" class="table table-bordered table-striped table-hover"data-hide-colums="<?php echo $hide_colums; ?>" data-print-columns="<?php echo $print_columns;?>">
                      <thead>
                        <tr class="bg-gray">
                          <th class="w-10">
                            <?php echo trans('label_serial_no'); ?>
                          </th>
                          <th class="w-15">
                            <?php echo trans('label_invoice_id'); ?>
                          </th>
                          <th class="w-20">
                            <?php echo trans('label_created_at'); ?>
                          </th>
                          <th class="w-20">
                            <?php echo sprintf(trans('label_college_name'), null); ?>
                          </th>
                          <th class="w-10">
                            <?php echo trans('label_quantity'); ?>
                          </th>
                          <th class="w-10">
                            <?php echo trans('label_purchase_price'); ?>
                          </th>
                          <th class="w-10">
                            <?php echo trans('label_selling_price'); ?>
                          </th>
                          <th class="w-10">
                            <?php echo trans('label_tax_amount'); ?>
                          </th>
                          <th class="w-10">
                            <?php echo trans('label_discount_amount'); ?>
                          </th>
                          <th class="w-10">
                            <?php echo trans('label_profit'); ?>
                          </th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr class="bg-gray">
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <?php endif; ?>
            <!-- End Sells Tab -->
          </div>
      </div>
        
      </div>
    </div>
  </section>
  <!-- Content End -->

</div>
<!-- Content Wrapper End -->

 <!-- Include Footer -->
<?php include ("footer.php"); ?>