<?php
ob_start();
session_start();
include("../_init.php");

// Check, if your logged in or not
// If user is not logged in then return an alert message
if (!is_loggedin()) {
  header('HTTP/1.1 422 Unprocessable Entity');
  header('Content-Type: application/json; charset=UTF-8');
  echo json_encode(array('errorMsg' => trans('error_login')));
  exit();
}

// Check, if user has reading permission or not
// If user have not reading permission return an alert message
if (user_group_id() != 1 && !has_permission('access', 'read_college')) {
  header('HTTP/1.1 422 Unprocessable Entity');
  header('Content-Type: application/json; charset=UTF-8');
  echo json_encode(array('errorMsg' => trans('error_read_permission')));
  exit();
}

// LOAD SUPPLIER MODEL
$college_model = registry()->get('loader')->model('college');

// Validate post data
function validate_request_data($request)
{
  // Validate college name
  if (!validateString($request->post['college_name'])) {
    throw new Exception(trans('error_college_name'));
  }

  // Validate college code name
  if (!validateString($request->post['code_name'])) {
    throw new Exception(trans('error_code_name'));
  }

  // Validate college slug
  if (!validateString($request->post['college_details'])) {
    throw new Exception(trans('error_college_responsible'));
  }

  // Validate store
  if (!isset($request->post['product_college']) || empty($request->post['product_college'])) {
    throw new Exception(trans('error_product_college'));
  }

  // Validate status
  if (!is_numeric($request->post['status'])) {
    throw new Exception(trans('error_status'));
  }

  // // Validate sort order
  // if (!is_numeric($request->post['sort_order'])) {
  //   throw new Exception(trans('error_sort_order'));
  // }
}

// Check, if already exist or not
function validate_existance($request, $id = 0)
{


  // Check, if college name exist or not
  $statement = db()->prepare("SELECT * FROM `colleges` WHERE (`college_name` = ? OR `code_name` = ?) AND `college_id` != ?");
  $statement->execute(array($request->post['college_name'], $request->post['code_name'], $id));
  if ($statement->rowCount() > 0) {
    throw new Exception(trans('error_college_exist'));
  }
}

// Create college
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['action_type']) && $request->post['action_type'] == 'CREATE') {
  try {

    // Check create permission
    if (user_group_id() != 1 && !has_permission('access', 'create_college')) {
      throw new Exception(trans('error_create_permission'));
    }

    // Validate post data
    validate_request_data($request);

    // Validate existance
    validate_existance($request);

    $statement = db()->prepare("SELECT * FROM `colleges` WHERE (`code_name` = ? OR `college_name` = ?)");
    $statement->execute(array($request->post['code_name'], $request->post['college_name']));
    $total = $statement->rowCount();
    if ($total > 0) {
      throw new Exception(trans('error_college_exist'));
    }

    $Hooks->do_action('Before_Create_College', $request);

    // Insert college into database
    $college_id = $college_model->addCollege($request->post);

    // get college info
    $college = $college_model->getCollege($college_id);

    // Add product to store
    if (!empty($request->post['product_college'])) {
      foreach ($request->post['product_college'] as $product_id) {

        // Fetch product info
        $product_info = get_the_product($product_id);

        //--- Category to store ---//

        // $statement = db()->prepare("SELECT * FROM `category_to_store` WHERE `store_id` = ? AND `ccategory_id` = ?");
        // $statement->execute(array($store_id, $product_info['category_id']));
        // $category = $statement->fetch(PDO::FETCH_ASSOC);
        // if (!$category) {
        //   $statement = db()->prepare("INSERT INTO `category_to_store` SET `ccategory_id` = ?, `store_id` = ?");
        //   $statement->execute(array((int)$product_info['category_id'], (int)$store_id));
        // }

        //--- Box to store ---//

        // $statement = db()->prepare("SELECT * FROM `box_to_store` WHERE `store_id` = ? AND `box_id` = ?");
        // $statement->execute(array($store_id, $product_info['box_id']));
        // $box = $statement->fetch(PDO::FETCH_ASSOC);
        // if (!$box) {
        //   $statement = db()->prepare("INSERT INTO `box_to_store` SET `box_id` = ?, `store_id` = ?");
        //   $statement->execute(array((int)$product_info['box_id'], (int)$store_id));
        // }

        //--- Supplier to store ---//

        // $statement = db()->prepare("SELECT * FROM `product_to_college` WHERE `college_id` = ? AND `product_id` = ?");
        // $statement->execute(array($college_id, $product_info['product_id']));
        // $supplier = $statement->fetch(PDO::FETCH_ASSOC);
        // if (!$supplier) {
        //   $statement = db()->prepare("INSERT INTO `product_to_college` SET `college_id` = ?, `product_id` = ?");
        //   $statement->execute(array((int)$college_id),(int)$product_info['product_id']);
        // }

        //--- Create product link ---//

        // REVISAR PASAR TODA LA INFO EDGAR

        $statement = db()->prepare("INSERT INTO `product_to_college` SET `college_id` = ?, `product_id` = ?");
        $statement->execute(array((int)$college_id, (int)$product_info['product_id']));
      }
    }

    $Hooks->do_action('After_Create_College', $college);

    // SET OUTPUT CONTENT TYPE
    header('Content-Type: application/json');
    echo json_encode(array('msg' => trans('text_success'), 'id' => $college_id, 'college' => $college));
    exit();
  } catch (Exception $e) {

    header('HTTP/1.1 422 Unprocessable Entity');
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode(array('errorMsg' => $e->getMessage()));
    exit();
  }
}

// Update college
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['action_type']) && $request->post['action_type'] == 'UPDATE') {
  try {

    // Check update permission
    if (user_group_id() != 1 && !has_permission('access', 'update_college')) {
      throw new Exception(trans('error_update_permission'));
    }

    // Validate product id
    if (empty($request->post['college_id'])) {
      throw new Exception(trans('error_college_id'));
    }

    $id = $request->post['college_id'];

    // Validate post data
    validate_request_data($request);

    // Validate existance
    validate_existance($request, $id);

    $Hooks->do_action('Before_Update_College', $request);

    // Edit college
    $college = $college_model->editCollege($id, $request->post);

    // Add product to store
    if (!empty($request->post['product_college'])) {
      foreach ($request->post['product_college'] as $product_id) {

        // Fetch product info
        $product_info = get_the_product($product_id, null);

        //--- Category to store ---//

        // $statement = db()->prepare("SELECT * FROM `category_to_store` WHERE `store_id` = ? AND `ccategory_id` = ?");
        // $statement->execute(array($id, $product_info['category_id']));
        // $category = $statement->fetch(PDO::FETCH_ASSOC);
        // if (!$category) {
        //    $statement = db()->prepare("INSERT INTO `category_to_store` SET `ccategory_id` = ?, `store_id` = ?");
        //     $statement->execute(array((int)$product_info['category_id'], (int)$id));
        // } 

        //--- Box to store ---//

        // $statement = db()->prepare("SELECT * FROM `box_to_store` WHERE `store_id` = ? AND `box_id` = ?");
        // $statement->execute(array($id, $product_info['box_id']));
        // $box = $statement->fetch(PDO::FETCH_ASSOC);
        // if (!$box) {
        //    $statement = db()->prepare("INSERT INTO `box_to_store` SET `box_id` = ?, `store_id` = ?");
        //     $statement->execute(array((int)$product_info['box_id'], (int)$id));
        // } 

        //--- Supplier to store ---//

        // $statement = db()->prepare("SELECT * FROM `supplier_to_store` WHERE `store_id` = ? AND `sup_id` = ?");
        // $statement->execute(array($id, $product_info['sup_id']));
        // $supplier = $statement->fetch(PDO::FETCH_ASSOC);
        // if (!$supplier) {
        //   $statement = db()->prepare("INSERT INTO `supplier_to_store` SET `sup_id` = ?, `store_id` = ?");
        //   $statement->execute(array((int)$product_info['sup_id'], (int)$id));
        // }

        //--- Create product link ---//
        $statement = db()->prepare("SELECT * FROM `product_to_college` WHERE `college_id` = ? AND `product_id` = ?");
        $statement->execute(array($id, (int)$product_id));
        $prodt = $statement->fetch(PDO::FETCH_ASSOC);
        if (!$prodt) {
          $statement = db()->prepare("INSERT INTO `product_to_college` SET `product_id` = ?, `college_id` = ?");
          $statement->execute(array((int)$product_id, (int)$id,));
        }
      }
    }

    $Hooks->do_action('After_Update_College', $college);

    header('Content-Type: application/json');
    echo json_encode(array('msg' => trans('text_update_success'), 'id' => $id));
    exit();
  } catch (Exception $e) {

    header('HTTP/1.1 422 Unprocessable Entity');
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode(array('errorMsg' => $e->getMessage()));
    exit();
  }
}

// Delete college
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['action_type']) && $request->post['action_type'] == 'DELETE') {
  try {

    // Check delete permission
    if (user_group_id() != 1 && !has_permission('access', 'delete_college')) {
      throw new Exception(trans('error_delete_permission'));
    }

    // Validate college id
    if (empty($request->post['college_id'])) {
      throw new Exception(trans('error_college_id'));
    }

    $id = $request->post['college_id'];
    $new_college_id = $request->post['new_college_id'];

    // Validate delete action
    if (empty($request->post['delete_action'])) {
      throw new Exception(trans('error_delete_action'));
    }

    if ($request->post['delete_action'] == 'insert_to' && empty($new_college_id)) {
      throw new Exception(trans('error_college_name'));
    }

    $Hooks->do_action('Before_Delete_College', $request);

    // $belongs_stores = $college_model->getBelongsStore($id);
    // foreach ($belongs_stores as $the_store) {

    //   // Check if relationship exist or not
    //   $statement = db()->prepare("SELECT * FROM `college_to_store` WHERE `college_id` = ? AND `store_id` = ?");
    //   $statement->execute(array($new_college_id, $the_store['store_id']));
    //   if ($statement->rowCount() > 0) continue;

    //   // Create relationship
    //   $statement = db()->prepare("INSERT INTO `college_to_store` SET `college_id` = ?, `store_id` = ?");
    //   $statement->execute(array($new_college_id, $the_store['store_id']));
    // }

    if ($request->post['delete_action'] == 'insert_to') {
      $statement = db()->prepare("UPDATE `holding_item` SET `college_id` = ? WHERE `college_id` = ?");
      $statement->execute(array($new_college_id, $id));

      $statement = db()->prepare("UPDATE `quotation_item` SET `college_id` = ? WHERE `college_id` = ?");
      $statement->execute(array($new_college_id, $id));

      $statement = db()->prepare("UPDATE `product_to_store` SET `college_id` = ? WHERE `college_id` = ?");
      $statement->execute(array($new_college_id, $id));

      $statement = db()->prepare("UPDATE `selling_item` SET `college_id` = ? WHERE `college_id` = ?");
      $statement->execute(array($new_college_id, $id));
    }

    // Delete college
    $college = $college_model->deleteCollege($id);

    $Hooks->do_action('After_Delete_College', $college);

    header('Content-Type: application/json');
    echo json_encode(array('msg' => trans('text_delete_success')));
    exit();
  } catch (Exception $e) {

    header('HTTP/1.1 422 Unprocessable Entity');
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode(array('errorMsg' => $e->getMessage()));
    exit();
  }
}

// college create form
if (isset($request->get['action_type']) && $request->get['action_type'] == 'CREATE') {
  $Hooks->do_action('Before_College_Create_Form');
  include 'template/college_create_form.php';
  $Hooks->do_action('After_College_Create_Form');
  exit();
}

// college edit form
if (isset($request->get['college_id']) && isset($request->get['action_type']) && $request->get['action_type'] == 'EDIT') {

  // Fetch college info
  $college = $college_model->getCollege($request->get['college_id']);
  $Hooks->do_action('Before_College_Edit_Form', $college);
  include 'template/college_form.php';
  $Hooks->do_action('After_College_Edit_Form', $college);
  exit();
}

// college delete form
if (isset($request->get['college_id']) && isset($request->get['action_type']) && $request->get['action_type'] == 'DELETE') {

  // Fetch college info
  $college = $college_model->getCollege($request->get['college_id']);
  $Hooks->do_action('Before_College_Delete_Form');
  include 'template/college_del_form.php';
  $Hooks->do_action('Before_College_Delete_Form');
  exit();
}

if (isset($request->get['action_type']) && $request->get['action_type'] == 'COLLEGE_PRODUCT') {

  $where_query = '`product_to_store`.`store_id` = ' . store_id();
  // $items = array();
  $statement = db()->prepare("SELECT `products`.`p_id`, `products`.`p_name`, `courses`.`course_name`, 0 AS estimatedsales
        FROM `products` 
        LEFT JOIN `product_to_store` ON (`product_to_store`.`product_id` = `products`.`p_id`)
        LEFT JOIN `courses` ON (`courses`.`course_id` = `product_to_store`.`course_id`)
        WHERE $where_query ORDER BY `products`.`p_name` ");
  $statement->execute();
  $rows = $statement->fetchAll(PDO::FETCH_ASSOC);
  // $products = array();
  // $i = 0;
  // foreach ($rows as $row) {
  //     $products[$i] = $row;
  //     $i++;
  // }

  // $invoice_model = registry()->get('loader')->model('invoice');
  // $payment_model = registry()->get('loader')->model('payment');
  // $items = $invoice_model->getInvoiceItems($order['invoice_id'], store_id());
  // $payments = $payment_model->getPayments($order['invoice_id'], store_id());
  // $order['customer_name'] = get_the_customer($order['customer_id'], 'customer_name');
  // $order['items']     = $items;
  // $order['table']     = '';
  // $order['payments']  = $payments;

  header('Content-Type: application/json');
  echo json_encode(array('msg' => trans('text_success'), 'products' => $rows));
  exit();
}

if (isset($request->get['action_type']) && $request->get['action_type'] == 'COLLEGE_PRODUCT_EDIT') {

  $where_query0 = 'b.`store_id` = ' . store_id();
  $where_query1 = 'd.college_id = ' . $request->get['college_id'];
  $where_query2 = 'b.`store_id` = ' . store_id();
  $where_query3 = '`product_to_store`.`store_id` = ' . store_id();
  // $items = array();
  $statement = db()->prepare("SELECT * from(
    SELECT a.`p_id`, a.`p_name`, c.`course_name`, 0 AS estimatedsales, 0 AS checkk
            FROM products a
            LEFT JOIN `product_to_store` b ON (b.`product_id` = a.`p_id`)
            LEFT JOIN `courses` c ON (c.`course_id` = b.`course_id`)
             WHERE $where_query0
             AND NOT EXISTS (SELECT * from product_to_college d WHERE d.product_id = a.p_id AND $where_query1)
    union
    SELECT a.p_id, a.p_name, c.course_name, d.estimatedsales, d.status AS checkk
    FROM products a 
    LEFT JOIN product_to_store b ON b.product_id = a.p_id
    LEFT JOIN courses c ON c.course_id = b.course_id
    LEFT JOIN product_to_college d ON d.product_id = a.p_id
    WHERE $where_query0 AND $where_query1) AS a1 ORDER BY a1.checkk DESC, a1.p_name");
  $statement->execute();
  $rows = $statement->fetchAll(PDO::FETCH_ASSOC);
  // $products = array();
  // $i = 0;
  // foreach ($rows as $row) {
  //     $products[$i] = $row;
  //     $i++;
  // }

  // $invoice_model = registry()->get('loader')->model('invoice');
  // $payment_model = registry()->get('loader')->model('payment');
  // $items = $invoice_model->getInvoiceItems($order['invoice_id'], store_id());
  // $payments = $payment_model->getPayments($order['invoice_id'], store_id());
  // $order['customer_name'] = get_the_customer($order['customer_id'], 'customer_name');
  // $order['items']     = $items;
  // $order['table']     = '';
  // $order['payments']  = $payments;

  header('Content-Type: application/json');
  echo json_encode(array('msg' => trans('text_success'), 'products' => $rows));
  exit();
}
// /**
//  *===================
//  * START DATATABLE
//  *===================
//  */
// $Hooks->do_action('Before_Showing_Product_College_List');

// $where_query = 'p1.store_id = ' . store_id();

// // DB table to use
// // $table = "(SELECT colleges.*, b2s.status, b2s.sort_order FROM colleges 
// //   LEFT JOIN college_to_store b2s ON (colleges.college_id = b2s.college_id) 
// //   WHERE $where_query GROUP by colleges.college_id
// //   ) as colleges";
// $table = "(SELECT p.p_id, p.p_name, c.course_name, 0 AS stimatedsales
//   FROM products p 
//   LEFT JOIN product_to_store p1 ON p1.product_id = p.p_id
//   LEFT JOIN courses c ON c.course_id = p1.course_id
//   WHERE $where_query GROUP by p.p_id
// ) as products";

// // Table's primary key
// $primaryKey = 'p_id';

// $columns = array(
//   array(
//     'db' => 'p_id',
//     'dt' => 'DT_RowId',
//     'formatter' => function ($d, $row) {
//       return 'row_' . $d;
//     }
//   ),
//   array(
//     'db' => 'p_id',
//     'dt' => 'select',
//     'formatter' => function ($d, $row) {
//       return '<input type="checkbox" name="selected[]" value="' . $row['p_id'] . '">';
//     }
//   ),
//   array('db' => 'p_id', 'dt' => 'p_id'),
//   array(
//     'db' => 'p_name',
//     'dt' => 'p_name',
//     'formatter' => function ($d, $row) {
//       return html_entity_decode($row['p_name']);
//     }
//   ),
//   array(
//     'db' => 'course_name',
//     'dt' => 'course_name',
//     'formatter' => function ($d, $row) {
//       return html_entity_decode($row['course_name']);
//     }
//   ),
//   array(
//     'db' => 'stimatedsales',
//     'dt' => 'stimatedsales',
//     'formatter' => function ($d, $row) {
//       return currency_format($row['stimatedsales']);
//     }
//   ),
// );

// echo json_encode(
//   SSP::simple($request->get, $sql_details, $table, $primaryKey, $columns)
// );

// $Hooks->do_action('After_Showing_Product_College_List');

// /**
//  *===================
//  * END DATATABLE
//  *===================
//  */
