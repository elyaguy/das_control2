<?php
function get_products($data = array())
{
	$model = registry()->get('loader')->model('product');
	return $model->getProducts($data);
}

function get_products_to_store($all = false)
{
	// $model = registry()->get('loader')->model('product');
	// return $model->getProductsToStore($data);
	// global $user;
	// if ($all || user_group_id() == 1) {
	$productModel = registry()->get('loader')->model('product');
	return $productModel->getProductsToStore();
	// } else {
	// 	return $user->getBelongsStore(store_id());
	// }
}

function get_products_to_store_college($all = false)
{
	$productModel = registry()->get('loader')->model('product');
	return $productModel->getProductsToStoreCollege();
}


function get_product_images($p_id)
{
	$model = registry()->get('loader')->model('product');
	return $model->getProductImages($p_id);
}

function get_the_product($id, $field = null, $store_id = null)
{
	$model = registry()->get('loader')->model('product');
	$product = $model->getProduct($id, $store_id);
	if ($field && isset($product[$field])) {
		return $product[$field];
	} elseif ($field) {
		return;
	}
	return $product;
}

function product_selling_price($p_id, $from, $to)
{
	$product_model = registry()->get('loader')->model('product');
	return $product_model->getSellingPrice($p_id, $from, $to);
}

function product_purchase_price($p_id, $from, $to)
{
	$product_model = registry()->get('loader')->model('product');
	return $product_model->getpurchasePrice($p_id, $from, $to);
}

function total_product_today($store_id = null)
{
	$product_model = registry()->get('loader')->model('product');
	return $product_model->totalToday($store_id);
}

function total_product($from = null, $to = null, $store_id = null)
{
	$product_model = registry()->get('loader')->model('product');
	return $product_model->total($from, $to, $store_id);
}

function total_trash_product()
{
	$product_model = registry()->get('loader')->model('product');
	return $product_model->totalTrash();
}
