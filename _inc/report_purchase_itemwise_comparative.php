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


// DB table to use
$table = "(SELECT purchase_info.*, 
purchase_item.item_id, item_name, item_purchase_price, SUM(item_quantity) item_quantity_purchase, SUM(purchase_item.item_total) AS total_purchase_price, 
SUM(return_quantity) item_quantity_return, SUM(return_quantity * item_purchase_price) AS total_purchase_price_return,
selling_item.selling_quantity_item AS item_quantity_selling, item_purchase_price * selling_item.selling_quantity_item AS total_paid_amount,
quantity_in_stock, (quantity_in_stock * purchase_price) total_stock_price

FROM purchase_item 
      LEFT JOIN purchase_info ON (purchase_item.invoice_id = purchase_info.invoice_id)
      LEFT JOIN purchase_price ON (purchase_item.invoice_id = purchase_price.invoice_id)
      LEFT JOIN product_to_store ON (purchase_item.item_id = product_to_store.product_id AND purchase_item.store_id = product_to_store.store_id)
      LEFT JOIN (SELECT item_id, store_id, SUM(item_quantity- return_quantity) selling_quantity_item FROM selling_item GROUP BY item_id, store_id) AS selling_item ON (purchase_item.item_id = selling_item.item_id AND purchase_item.store_id = selling_item.store_id)

      WHERE $where_query
      GROUP BY purchase_item.item_id
      ORDER BY item_name) as products";

// Table's primary key
$primaryKey = 'item_id';
$columns = array(
    array( 'db' => 'item_id', 'dt' => 'item_id' ),
    array( 
      'db' => 'created_at',  
      'dt' => 'created_at',
      'formatter' => function( $d, $row ) {
        return date('Y-m-d', strtotime($row['created_at']));
      }
    ),
    array( 
      'db' => 'item_name',  
      'dt' => 'item_name',
      'formatter' => function( $d, $row ) {
        return '<a href="product.php?p_id=' . $row['item_id'] . '&p_name=' . $row['item_name'] . '">' . $row['item_name'] . '</a>';
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