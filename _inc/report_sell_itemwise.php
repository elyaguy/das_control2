<?php 
ob_start();
session_start();
include ("../_init.php");

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
if (user_group_id() != 1 && !has_permission('access', 'read_sell_report')) {
  header('HTTP/1.1 422 Unprocessable Entity');
  header('Content-Type: application/json; charset=UTF-8');
  echo json_encode(array('errorMsg' => trans('error_read_permission')));
  exit();
}

$reprot_model = registry()->get('loader')->model('report');
$store_id = store_id();

/**
 *===================
 * START DATATABLE
 *===================
 */

$where_query = "selling_info.inv_type != 'due_paid' AND selling_info.store_id = '{$store_id}'";
if (isset($request->get['pid']) && $request->get['pid'] && $request->get['pid'] != 'null') {
  $where_query .= " AND item_id = " . $request->get['pid'];
}
//Para cuando sea rol de colegio y proveedor
// 6 proveedor 7 colegio
if (user_group_id() == 7) {
  $where_query .= " AND selling_item.college_id = " . userFK_id();
}

$from = from();
$to = to();
$where_query .= date_range_filter($from, $to);

// DB table to use
$table = "(SELECT @sl:=@sl+1 AS sl, selling_info.invoice_id, selling_info.created_at, selling_item.id, selling_item.item_id, selling_item.item_name, SUM(selling_item.item_quantity) as total_item, SUM(selling_item.item_discount) as discount, SUM(selling_item.item_tax) as tax, SUM(selling_item.item_purchase_price) as purchase_price, SUM(selling_item.item_total) as sell_price , course_name , SUM(product_to_college.estimatedsales) as estimated_sales
  FROM selling_item 
  LEFT JOIN selling_info ON (selling_item.invoice_id = selling_info.invoice_id)
  LEFT JOIN selling_price ON (selling_item.invoice_id = selling_price.invoice_id)
  LEFT JOIN product_to_store ON (selling_item.item_id = product_to_store.product_id AND selling_item.store_id = product_to_store.store_id)
  LEFT JOIN product_to_college ON (selling_item.item_id = product_to_college.product_id AND selling_item.college_id = product_to_college.college_id)
  LEFT JOIN courses ON (product_to_store.course_id = courses.course_id)
  WHERE $where_query
  GROUP BY selling_item.item_id
  ORDER BY sell_price DESC) as selling_item";

// Table's primary key
$primaryKey = 'id';

$columns = array(
    array( 'db' => 'sl', 'dt' => 'sl' ),
    array( 'db' => 'item_id', 'dt' => 'id' ),
    array( 'db' => 'invoice_id', 'dt' => 'invoice_id' ),
    array( 'db' => 'course_name', 'dt' => 'course_name' ),
    array( 'db' => 'estimated_sales', 'dt' => 'estimated_sales' ),    
    array( 
      'db' => 'created_at',
      'dt' => 'selling_date',
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
      'db' => 'total_item',  
      'dt' => 'total_item',
      'formatter' => function( $d, $row ) {
        return currency_format($row['total_item']);
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
      'db' => 'sell_price',  
      'dt' => 'sell_price',
      'formatter' => function( $d, $row ) use($reprot_model) {
        $discount = $reprot_model->getTotalDiscountAmountBy('itemwise', $row['invoice_id'], from(), to(), store_id());
        $total = $row['sell_price'] - $discount;
        return currency_format($total);

      }
    ),
    array( 
      'db' => 'tax',  
      'dt' => 'tax',
      'formatter' => function( $d, $row ) {
        return currency_format($row['tax']);
      }
    ),
    array( 
      'db' => 'discount',  
      'dt' => 'discount',
      'formatter' => function( $d, $row ) use($reprot_model) {
        $discount = $reprot_model->getTotalDiscountAmountBy('itemwise', $row['invoice_id'], from(), to(), store_id());
        return currency_format($discount);

      }
    ),
    array( 
      'db' => 'sell_price',
      'dt' => 'profit',
      'formatter' => function( $d, $row ) use($reprot_model) {
        $discount = $reprot_model->getTotalDiscountAmountBy('itemwise', $row['invoice_id'], from(), to(), store_id());
        $total = ($row['sell_price'] - $row['purchase_price']) - $discount;
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