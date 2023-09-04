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
$table = "(SELECT purchase_info.*, categorys.category_name, purchase_item.id, purchase_item.category_id, purchase_item.item_quantity, SUM(purchase_item.item_total) as purchase_price, SUM(purchase_item.item_quantity) as total_stock, SUM(purchase_price.paid_amount) as paid_amount FROM purchase_item 
      LEFT JOIN categorys ON (purchase_item.category_id = categorys.category_id)
      LEFT JOIN purchase_info ON (purchase_item.invoice_id = purchase_info.invoice_id)
      LEFT JOIN purchase_price ON (purchase_item.invoice_id = purchase_price.invoice_id)
      WHERE $where_query
      GROUP BY purchase_item.category_id
      ORDER BY total_stock DESC) as purchase_item";

// DB table to use
$table = "(SELECT purchase_info.*, categorys.category_name, purchase_item.id, purchase_item.category_id, purchase_item.item_quantity, SUM(purchase_item.item_total) as purchase_price, SUM(purchase_item.item_quantity) as total_stock, 
SUM(item_selling_price * item_quantity) as paid_amount, 0 unit_cost, product_to_store.quantity_in_stock,
product_to_store.value_in_stock,selling_item.selling_quantity_item
FROM purchase_item 
LEFT JOIN categorys ON (purchase_item.category_id = categorys.category_id)
LEFT JOIN purchase_info ON (purchase_item.invoice_id = purchase_info.invoice_id)
LEFT JOIN purchase_price ON (purchase_item.invoice_id = purchase_price.invoice_id)
LEFT JOIN (SELECT category_id, store_id, SUM(product_to_store.quantity_in_stock) quantity_in_stock, SUM(product_to_store.sell_price * product_to_store.quantity_in_stock) value_in_stock 
FROM product_to_store LEFT JOIN products ON product_id = p_id  GROUP BY category_id, store_id) AS product_to_store ON (purchase_item.category_id = product_to_store.category_id AND purchase_item.store_id = product_to_store.store_id)
LEFT JOIN (SELECT category_id, store_id, SUM(item_quantity- return_quantity) selling_quantity_item FROM selling_item GROUP BY category_id, store_id) AS selling_item ON (purchase_item.category_id = selling_item.category_id AND purchase_item.store_id = selling_item.store_id)

WHERE $where_query
GROUP BY purchase_item.category_id
ORDER BY total_stock DESC) as purchase_item";

// Table's primary key
$primaryKey = 'id';
$columns = array(
  array( 'db' => 'category_id', 'dt' => 'category_id' ),
  array( 'db' => 'unit_cost', 'dt' => 'unit_cost' ),
  array( 
      'db' => 'created_at',  
      'dt' => 'created_at',
      'formatter' => function( $d, $row ) {
        return date('Y-m-d', strtotime($row['created_at']));
      }
    ),
    array( 
      'db' => 'category_name',  
      'dt' => 'category_name',
      'formatter' => function( $d, $row ) {
        return $row['category_name'];
      }
    ),
    array( 
      'db' => 'total_stock',  
      'dt' => 'total_item',
      'formatter' => function( $d, $row ) {
        return currency_format($row['total_stock']);
      }
    ),
    array( 
      'db' => 'quantity_in_stock',  
      'dt' => 'quantity_in_stock',
      'formatter' => function( $d, $row ) {
        return currency_format($row['quantity_in_stock']);
      }
    ),
    array( 
      'db' => 'value_in_stock',  
      'dt' => 'value_in_stock',
      'formatter' => function( $d, $row ) {
        return currency_format($row['value_in_stock']);
      }
    ),
    array( 
      'db' => 'selling_quantity_item',  
      'dt' => 'selling_quantity_item',
      'formatter' => function( $d, $row ) {
        return currency_format($row['selling_quantity_item']);
      }
    ),
    array( 
      'db' => 'purchase_price',  
      'dt' => 'purchase_price',
      'formatter' => function( $d, $row ) {
        $total = $row['purchase_price'];
        return currency_format($total);
      }
    ),
    array( 
      'db' => 'paid_amount',  
      'dt' => 'paid_amount',
      'formatter' => function( $d, $row ) {
        $total = $row['paid_amount'];
        return currency_format($total);
      }
    )
);
 
echo json_encode(
    SSP::simple( $request->get, $sql_details, $table, $primaryKey, $columns )
);

/**
 *===================
 * END DATATABLE
 *===================
 */