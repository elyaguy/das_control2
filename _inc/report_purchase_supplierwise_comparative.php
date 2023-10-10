<?php 
ob_start();
session_start();
include ("../_init.php");

// Check, if user logged in or not
// If user is not logged in then return an alert message
if (!is_loggedin()) {
  header('HTTP/1.1 422 Unprocessable Entity');
  header('Content-Type: application/json; charset=UTF-8');
  echo json_encode(array('errorMsg' => trans('error_login')));
  exit();
}

// Check, if user has reading permission or not
// If user have not reading permission return an alert message
if (user_group_id() != 1 && !has_permission('access', 'read_purchase_all_report')) {
  header('HTTP/1.1 422 Unprocessable Entity');
  header('Content-Type: application/json; charset=UTF-8');
  echo json_encode(array('errorMsg' => trans('error_read_permission')));
  exit();
}

/**
 *===================
 * START DATATABLE
 *===================
 */

$where_query = "purchase_info.inv_type != 'expense' AND purchase_item.store_id = " . store_id();
$from = from();
$to = to();
$where_query .= date_range_filter2($from, $to);

// suppliers.sup_name, purchase_item.item_quantity, SUM(purchase_item.item_total) as purchase_price, SUM(purchase_item.item_quantity) as total_stock, 
// SUM(item_selling_price * item_quantity) as paid_amount , 0 unit_cost, product_to_store.quantity_in_stock, value_in_stock, selling_item.selling_quantity_item

// DB table to use
$table = "(SELECT purchase_info.*, 
suppliers.sup_name, item_name,0 item_purchase_price, SUM(item_quantity) item_quantity_purchase, SUM(purchase_item.item_total) AS total_purchase_price, 
SUM(return_quantity) item_quantity_return, SUM(return_quantity * item_purchase_price) AS total_purchase_price_return,
selling_item.selling_quantity_item AS item_quantity_selling, total_paid_amount AS total_paid_amount,
(quantity_in_stock) quantity_in_stock, value_in_stock total_stock_price

FROM purchase_info 
      LEFT JOIN suppliers ON (purchase_info.sup_id = suppliers.sup_id)
      LEFT JOIN purchase_item ON (purchase_info.invoice_id = purchase_item.invoice_id)
      LEFT JOIN purchase_price ON (purchase_info.invoice_id = purchase_price.invoice_id)
      LEFT JOIN (SELECT sup_id, store_id, SUM(product_to_store.quantity_in_stock) quantity_in_stock, SUM(product_to_store.purchase_price * product_to_store.quantity_in_stock) value_in_stock 
        FROM product_to_store 
        LEFT JOIN products ON product_id = p_id  GROUP BY sup_id, store_id) AS product_to_store ON (purchase_info.sup_id = product_to_store.sup_id AND purchase_info.store_id = product_to_store.store_id)
      LEFT JOIN (SELECT sup_id, store_id, SUM(item_purchase_price- (return_quantity * (item_purchase_price/item_quantity))) total_paid_amount, SUM(item_quantity- return_quantity) selling_quantity_item 
      FROM selling_item GROUP BY sup_id, store_id) AS selling_item ON (purchase_info.sup_id = selling_item.sup_id AND purchase_info.store_id = selling_item.store_id)

WHERE $where_query
      GROUP BY purchase_info.sup_id
      ORDER BY suppliers.sup_name DESC) as purchase_info";

// Table's primary key
$primaryKey = 'info_id';
$columns = array(
    array( 'db' => 'sup_id', 'dt' => 'sup_id' ),

    array( 
      'db' => 'created_at',  
      'dt' => 'created_at',
      'formatter' => function( $d, $row ) {
        return date('Y-m-d', strtotime($row['created_at']));
      }
    ),
    array( 
      'db' => 'sup_name',  
      'dt' => 'sup_name',
      'formatter' => function( $d, $row ) {
        return $row['sup_name'];
      }
    ),
    array( 
      'db' => 'item_purchase_price',  
      'dt' => 'item_purchase_price',
      'formatter' => function( $d, $row ) {
        $total = $row['item_purchase_price'];
        return currency_format($total);
      }
    ),
    array( 
      'db' => 'item_quantity_purchase',  
      'dt' => 'item_quantity_purchase',
      'formatter' => function( $d, $row ) {
        $total = $row['item_quantity_purchase'];
        return currency_format($total);
      }
    ),
    array( 
      'db' => 'total_purchase_price',  
      'dt' => 'total_purchase_price',
      'formatter' => function( $d, $row ) {
        return currency_format($row['total_purchase_price']);
      }
    ),  


    array( 
      'db' => 'item_quantity_return',  
      'dt' => 'item_quantity_return',
      'formatter' => function( $d, $row ) {
        return currency_format($row['item_quantity_return']);
      }
    ),    
    array( 
      'db' => 'total_purchase_price_return',  
      'dt' => 'total_purchase_price_return',
      'formatter' => function( $d, $row ) {
        return currency_format($row['total_purchase_price_return']);
      }
    ),


    array( 
      'db' => 'item_quantity_selling',  
      'dt' => 'item_quantity_selling',
      'formatter' => function( $d, $row ) {
        return currency_format($row['item_quantity_selling']);
      }
    ),
    array( 
      'db' => 'total_paid_amount',  
      'dt' => 'total_paid_amount',
      'formatter' => function( $d, $row ) {
        return currency_format($row['total_paid_amount']);
      }
    ),

   
    array( 
      'db' => 'quantity_in_stock',  
      'dt' => 'quantity_in_stock',
      'formatter' => function( $d, $row ) {
        $total = $row['quantity_in_stock'];
        return currency_format($total);
      }
    ),
    array( 
      'db' => 'total_stock_price',  
      'dt' => 'total_stock_price',
      'formatter' => function( $d, $row ) {
        $total = $row['total_stock_price'];
        return currency_format($total);
      }
    ),
);

echo json_encode(
    SSP::simple( $request->get, $sql_details, $table, $primaryKey, $columns )
);

/**
 *===================
 * END DATATABLE
 *===================
 */