<?php
function get_college_id_by_code($id)
{

	$model = registry()->get('loader')->model('college');
	return $model->getCollegeIdByCode($id);
}

function get_colleges($data = array())
{

	$model = registry()->get('loader')->model('college');
	return $model->getColleges($data);
}

function get_the_college($id, $field = null)
{

	$model = registry()->get('loader')->model('college');
	$college = $model->getCollege($id);
	if ($field && isset($college[$field])) {
		return $college[$field];
	} elseif ($field) {
		return;
	}
	return $college;
}

function college_selling_price($college_id, $from, $to)
{

	$college_model = registry()->get('loader')->model('college');
	return $college_model->getSellingPrice($college_id, $from, $to);
}

function college_purchase_price($college_id, $from, $to)
{

	$college_model = registry()->get('loader')->model('college');
	return $college_model->getpurchasePrice($college_id, $from, $to);
}

function total_college_today($store_id = null)
{

	$college_model = registry()->get('loader')->model('college');
	return $college_model->totalToday($store_id);
}

function total_college($from = null, $to = null, $store_id = null)
{

	$college_model = registry()->get('loader')->model('college');
	return $college_model->total($from, $to, $store_id);
}

function total_product_of_college($college_id)
{	
	$college_model = registry()->get('loader')->model('college');
	return $college_model->totalProduct($college_id);

}


function get_product_store_college($college_id= null)
{
	$college_model = registry()->get('loader')->model('college');
	return $college_model->getProductStoreCollege(store_id(), $college_id);
}
