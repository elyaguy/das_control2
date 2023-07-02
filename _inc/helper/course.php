<?php
function get_course_id_by_code($id) 
{
	
	$model = registry()->get('loader')->model('course');
	return $model->getCourseIdByCode($id);
}

function get_courses($data = array()) 
{
	
	$model = registry()->get('loader')->model('course');
	return $model->getCourses($data);
}

// function get_course_tree($data = array(), $store = null) 
// {	
// 	$model = registry()->get('loader')->model('course');
// 	return $model->getCourseTree($data, $store);
// }

function get_the_course($id, $field = null) 
{
	
	$model = registry()->get('loader')->model('course');
	$course = $model->getCourse($id);
	if ($field && isset($course[$field])) {
		return $course[$field];
	} elseif ($field) {
		return;
	}
	return $course;
}

function get_total_valid_course_item($course_id)
{	
	$model = registry()->get('loader')->model('course');
	return $model->totalValidItem($course_id);
}

function course_selling_price($course_id, $from, $to)
{
	
	$course_model = registry()->get('loader')->model('course');
	return $course_model->getSellingPrice($course_id, $from, $to);
}

function course_purchase_price($course_id, $from, $to)
{
	
	$course_model = registry()->get('loader')->model('course');
	return $course_model->getpurchasePrice($course_id, $from, $to);
}

function total_course_today($store_id = null)
{
	
	$course_model = registry()->get('loader')->model('course');
	return $course_model->totalToday($store_id);
}

function total_course($from = null, $to = null, $store_id = null)
{
	
	$course_model = registry()->get('loader')->model('course');
	return $course_model->total($from, $to, $store_id);
}

function total_product_of_course($course_id)
{
	
	$course_model = registry()->get('loader')->model('course');
	return $course_model->totalProduct($course_id);

}