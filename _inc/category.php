<?php 
ob_start();
session_start();
include ("../_init.php");

// Check, if user logged in or not
// If user is not logged in then an alert message
if (!is_loggedin()) {
  header('HTTP/1.1 422 Unprocessable Entity');
  header('Content-Type: application/json; charset=UTF-8');
  echo json_encode(array('errorMsg' => trans('error_login')));
  exit();
}

// Check, if user has reading permission or not
// If user have not reading permission an alert message
if (user_group_id() != 1 && !has_permission('access', 'read_category')) {
  header('HTTP/1.1 422 Unprocessable Entity');
  header('Content-Type: application/json; charset=UTF-8');
  echo json_encode(array('errorMsg' => trans('error_read_permission')));
  exit();
}

// LOAD CATEGORY MODEL
$category_model = registry()->get('loader')->model('category');

// Validate post data
function validate_request_data($request) 
{
  // Validate category name
  if (!validateString($request->post['category_name'])) {
    throw new Exception(trans('error_category_name'));
  }

  // Validate category designation
  // if (!validateString($request->post['category_slug'])) {
  //   throw new Exception(trans('error_category_slug'));
  // }

  // Store id validation
  // if (!isset($request->post['category_store']) || empty($request->post['category_store'])) {
  //   throw new Exception(trans('error_store'));
  // }

  // Sort order validation
  if (!is_numeric($request->post['status'])) {
    throw new Exception(trans('error_status'));
  }

  // Sort order validation
  // if (!is_numeric($request->post['sort_order'])) {
  //   throw new Exception(trans('error_sort_order'));
  // }
}

// Check category existance by id
function validate_existance($request, $category_id = 0)
{
  

  // Check email address, if exist or not?
  if (!empty($request->post['category_slug'])) {
    $statement = db()->prepare("SELECT * FROM `categorys` WHERE `category_slug` = ? AND `category_id` != ?");
    $statement->execute(array($request->post['category_slug'], $category_id));
    if ($statement->rowCount() > 0) {
      throw new Exception(trans('error_category_exist'));
    }
  }
}

// Create category
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['action_type']) && $request->post['action_type'] == 'CREATE')
{
  try {

    // Check permission
    if (user_group_id() != 1 && !has_permission('access', 'create_category')) {
      throw new Exception(trans('error_create_permission'));
    }

    // Validate post data
    validate_request_data($request);
    
    // validte existance
    validate_existance($request);

    $Hooks->do_action('Before_Create_Category', $request);

    // Insert new category into databtase
    $category_id = $category_model->addCategory($request->post);

    // Fetch category info
    $category = $category_model->getCategory($category_id);

    $Hooks->do_action('After_Create_Category', $category);

    header('Content-Type: application/json');
    echo json_encode(array('msg' => trans('text_success'), 'id' => $category_id, 'category' => $category));
    exit();

  } catch (Exception $e) { 

    header('HTTP/1.1 422 Unprocessable Entity');
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode(array('errorMsg' => $e->getMessage()));
    exit();
  }
}

// Update category
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['action_type']) && $request->post['action_type'] == 'UPDATE')
{
  try {

    // Check update permission
    if (user_group_id() != 1 && !has_permission('access', 'update_category')) {
      throw new Exception(trans('error_update_permission'));
    }

    // Validate product id
    if (empty($request->post['category_id'])) {
      throw new Exception(trans('error_category_id'));
    }

    $category_id = $request->post['category_id'];

    if (DEMO && $category_id == 1) {
      throw new Exception(trans('error_update_permission'));
    }

    // Validate post data
    validate_request_data($request);

    // validte existance
    validate_existance($request, $category_id);

    $Hooks->do_action('Before_Update_Category', $request);
    
    // Edit category
    $category = $category_model->editCategory($category_id, $request->post);

    $Hooks->do_action('After_Update_Category', $category);

    header('Content-Type: application/json');
    echo json_encode(array('msg' => trans('text_update_success'), 'id' => $category_id));
    exit();

  } catch (Exception $e) { 
    
    header('HTTP/1.1 422 Unprocessable Entity');
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode(array('errorMsg' => $e->getMessage()));
    exit();
  }
} 

// Delete category
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['action_type']) && $request->post['action_type'] == 'DELETE') 
{
  try {

    // Check delete permission
    if (user_group_id() != 1 && !has_permission('access', 'delete_category')) {
      throw new Exception(trans('error_delete_permission'));
    }

    // Validate category id
    if (empty($request->post['category_id'])) {
      throw new Exception(trans('error_category_id'));
    }

    $category_id = $request->post['category_id'];
    $the_category = $category_model->getCategory($category_id);

    if (DEMO && $category_id == 1) {
      throw new Exception(trans('error_delete_permission'));
    }

    if (!$the_category) {
      throw new Exception(trans('error_category_id'));
    }

    $new_category_id = $request->post['new_category_id'];

    // walking category can not be deleted
    if ($request->post['category_id'] == 1) {
      throw new Exception(trans('error_delete_unable'));
    }

    // validte delete action
    if (empty($request->post['delete_action'])) {
      throw new Exception(trans('error_delete_action'));
    }

    if ($request->post['delete_action'] == 'insert_to' && empty($new_category_id)) {
      throw new Exception(trans('error_new_category_name'));
    }

    $Hooks->do_action('Before_Delete_Category', $request);

    if ($request->post['delete_action'] == 'insert_to') {
      $category_model->replaceWith($new_category_id, $category_id);
    } 

    // Delete category
    $category = $category_model->deleteCategory($category_id);

    $Hooks->do_action('After_Delete_Category', $category);

    header('Content-Type: application/json');
    echo json_encode(array('msg' => trans('text_delete_success'), 'id' => $category_id));
    exit();

  } catch (Exception $e) {

    header('HTTP/1.1 422 Unprocessable Entity');
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode(array('errorMsg' => $e->getMessage()));
    exit();
  }
}

// View invoice details
if (isset($request->get['action_type']) AND $request->get['action_type'] == 'INVOICEDETAILS') {

    try {

      $category_id = isset($request->get['category_id']) ? $request->get['category_id'] : null;
      $where_query = "((`selling_info`.`invoice_type` = 'sell' AND `selling_info`.`edit_count` < 1) OR `selling_info`.`invoice_type` = 'sell_edit')  AND `selling_item`.`category_id` = ?  AND `invoice_status` = ?";
      $from = from() ? from() : date('Y-m-d');
      $to = to() ? to() : date('Y-m-d');
      $where_query .= date_range_filter($from, $to);

      $statement = db()->prepare("SELECT `selling_info`.*, `selling_item`.`category_id`, SUM(`selling_item`.`item_total_price`) AS `item_total_price`, SUM(`selling_item`.`item_discount`) AS `item_discount` FROM `selling_item` 
          LEFT JOIN `selling_info` ON (`selling_item`.`invoice_id` = `selling_info`.`invoice_id`)
          WHERE $where_query GROUP BY `selling_item`.`invoice_id`");
      $statement->execute(array($category_id, 1));
      $the_invoices = $statement->fetchAll(PDO::FETCH_ASSOC);
      if (!$statement->rowCount() > 0) {
          throw new Exception(trans('error_not_found'));
      }

      $invoices = array();
      $from = date('Y-m-d H:i:s', strtotime($from.' '.'00:00:00')); 
      $to = date('Y-m-d H:i:s', strtotime($to.' '.'23:59:59'));
      foreach ($the_invoices as $invoice) {
        if (!$invoice['ref_invoice_id']) {
          $invoices[$invoice['invoice_id']] = $invoice;
          continue;
        }
        $ref_invoice = get_the_invoice($invoice['ref_invoice_id']);
        if ($from == $to) {
            if (date('Y-m-d', strtotime($ref_invoice['created_at'])) == date('Y-m-d')) {
                $invoices[$ref_invoice['invoice_id']] = $invoice;
            }
        } elseif ((date('Y-m-d H:i:s', strtotime($ref_invoice['created_at'])) >= $from) && (date('Y-m-d H:i:s', strtotime($ref_invoice['created_at'])) <= $to)) {
            $invoices[$ref_invoice['invoice_id']] = $invoice;
        }
      }

      include('template/category_invoice_details.php');
      exit();
        
    } catch (Exception $e) { 

      header('HTTP/1.1 422 Unprocessable Entity');
      header('Content-Type: application/json; charset=UTF-8');
      echo json_encode(array('errorMsg' => $e->getMessage()));
      exit();
    }
}

// Category create form
if (isset($request->get['action_type']) && $request->get['action_type'] == 'CREATE') 
{
  include 'template/category_create_form.php';
  exit();
}

// Category edit form
if (isset($request->get['category_id']) AND isset($request->get['action_type']) && $request->get['action_type'] == 'EDIT') 
{
  $category = $category_model->getCategory($request->get['category_id']);
  include 'template/category_edit_form.php';
  exit();
}

// Category delete form
if (isset($request->get['category_id']) AND isset($request->get['action_type']) && $request->get['action_type'] == 'DELETE') 
{
  $category = $category_model->getCategory($request->get['category_id']);
  include 'template/category_delete_form.php';
  exit();
}

/**
 *===================
 * START DATATABLE
 *===================
 */

$Hooks->do_action('Before_Showing_Category_List');

// $where_query = 'c2s.store_id = ' . store_id();
 
// DB table to use
// $table = "(SELECT categorys.*, c2s.status, c2s.sort_order FROM categorys 
//   LEFT JOIN category_to_store c2s ON (categorys.category_id = c2s.ccategory_id) 
//   WHERE $where_query GROUP by categorys.category_id
//   ) as categorys";
 
$table = "(SELECT categorys.* FROM categorys 
  GROUP by categorys.category_id
  ) as categorys";

// Table's primary key
$primaryKey = 'category_id';

$columns = array(
  array(
      'db' => 'category_id',
      'dt' => 'DT_RowId',
      'formatter' => function( $d, $row ) {
          return 'row_'.$d;
      }
  ),
  array( 'db' => 'category_id', 'dt' => 'category_id' ),
  array( 'db' => 'parent_id', 'dt' => 'parent_id' ),
  array( 
    'db' => 'category_name',   
    'dt' => 'category_name',
    'formatter' => function($d, $row) {
      $name = '';
      $parent = get_the_category($row['parent_id']);
      if (isset($parent['category_name'])) {
        $name = $parent['category_name'] .  ' > ';
      }
      return $name . $row['category_name'];
    }
  ),
  array( 'db' => 'category_slug', 'dt' => 'category_slug' ),
  array( 
    'db' => 'category_id',   
    'dt' => 'total_item',
    'formatter' => function($d, $row) use($category_model) {
      return $category_model->totalItem($row['category_id']);
    }
  ),
  // array( 
  //   'db' => 'sort_order',   
  //   'dt' => 'sort_order',
  //   'formatter' => function($d, $row) {
  //     return $row['sort_order'];
  //   }
  // ),
  array( 
    'db' => 'status',   
    'dt' => 'status',
    'formatter' => function($d, $row) {
      return $row['status'] 
        ? '<span class="label label-success">'.trans('text_active').'</span>' 
        : '<span class="label label-warning">' .trans('text_inactive').'</span>';
    }
  ),
  array( 
    'db' => 'created_at',   
    'dt' => 'created_at' ,
    'formatter' => function($d, $row) {
        return $row['created_at'];
    }
  ),
  array(
    'db'        => 'category_id',
    'dt'        => 'btn_edit',
    'formatter' => function( $d, $row ) {
      if (DEMO && $row['category_id'] == 1) {          
        return'<button class="btn btn-sm btn-block btn-default" type="button" disabled><i class="fa fa-pencil"></i></button>';
      }
      return '<button id="edit-category" class="btn btn-sm btn-block btn-primary" type="button" title="'.trans('button_edit').'"><i class="fa fa-fw fa-pencil"></i></button>';
    }
  ),
  array(
    'db'        => 'category_id',
    'dt'        => 'btn_delete',
    'formatter' => function( $d, $row ) {
      if ($row['category_id'] == 1) {
        return '<button class="btn btn-sm btn-block btn-default" type="button" disabled><i class="fa fa-fw fa-trash"></i></button>';
      }
      return '<button id="delete-category" class="btn btn-sm btn-block btn-danger" type="button" title="'.trans('button_delete').'"><i class="fa fa-fw fa-trash"></i></button>';
    }
  )
); 

echo json_encode(
    SSP::simple($request->get, $sql_details, $table, $primaryKey, $columns)
);

$Hooks->do_action('After_Showing_Category_List');

/**
 *===================
 * END DATATABLE
 *===================
 */