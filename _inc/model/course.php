<?php
/*
| -----------------------------------------------------
| PRODUCT NAME: 	Modern POS
| -----------------------------------------------------
| AUTHOR:			ITSOLUTION24.COM
| -----------------------------------------------------
| EMAIL:			info@itsolution24.com
| -----------------------------------------------------
| COPYRIGHT:		RESERVED BY ITSOLUTION24.COM
| -----------------------------------------------------
| WEBSITE:			http://itsolution24.com
| -----------------------------------------------------
*/
class ModelCourse extends Model 
{
	public function addCourse($data) 
	{
		$code_name = slugify($data['course_name']);
    	$statement = $this->db->prepare("INSERT INTO `courses` (course_name, code_name, course_details, course_image, status, created_at) VALUES (?, ?, ?, ?, ?, ?)");
    	// $statement->execute(array($data['course_name'], $data['code_name'], $data['course_details'], $data['course_image'], date_time()));
    	$statement->execute(array($data['course_name'], $code_name, $data['course_details'], $data['course_image'], 1, date_time()));
    	$course_id = $this->db->lastInsertId();
    	// if (isset($data['course_store'])) {
		// 	foreach ($data['course_store'] as $store_id) {
		// 		$statement = $this->db->prepare("INSERT INTO `course_to_store` SET `course_id` = ?, `store_id` = ?");
		// 		$statement->execute(array((int)$course_id, (int)$store_id));
		// 	}
		// }
		// $this->updateStatus($course_id, $data['status']);
		// $this->updateSortOrder($course_id, $data['sort_order']);
    	return $course_id;   
	}

	// public function updateStatus($course_id, $status, $store_id = null) 
	// {
	// 	$store_id = $store_id ? $store_id : store_id();
	// 	$statement = $this->db->prepare("UPDATE `course_to_store` SET `status` = ? WHERE `store_id` = ? AND `course_id` = ?");
	// 	$statement->execute(array((int)$status, $store_id, (int)$course_id));
	// }

	// public function updateSortOrder($course_id, $sort_order, $store_id = null) 
	// {
	// 	$store_id = $store_id ? $store_id : store_id();
	// 	$statement = $this->db->prepare("UPDATE `course_to_store` SET `sort_order` = ? WHERE `store_id` = ? AND `course_id` = ?");
	// 	$statement->execute(array((int)$sort_order, $store_id, (int)$course_id));
	// }

	public function editCourse($course_id, $data) 
	{
		$code_name = slugify($data['course_name']);
    	$statement = $this->db->prepare("UPDATE `courses` SET `course_name` = ?, `code_name` = ?, `course_details` = ?, `course_image` = ? WHERE `course_id` = ? ");
    	//$statement->execute(array($data['course_name'], $data['code_name'], $data['course_details'], $data['course_image'], $course_id));
		$statement->execute(array($data['course_name'], $code_name, $data['course_details'], $data['course_image'], $course_id));
		
		// Insert course into store
    	// if (isset($data['course_store'])) 
    	// {
    	// 	$store_ids = array();
		// 	foreach ($data['course_store'] as $store_id) {
		// 		$statement = $this->db->prepare("SELECT * FROM `course_to_store` WHERE `store_id` = ? AND `course_id` = ?");
		// 	    $statement->execute(array($store_id, $course_id));
		// 	    $course = $statement->fetch(PDO::FETCH_ASSOC);
		// 	    if (!$course) {
		// 	    	$statement = $this->db->prepare("INSERT INTO `course_to_store` SET `course_id` = ?, `store_id` = ?");
		// 			$statement->execute(array((int)$course_id, (int)$store_id));
		// 	    }
		// 	    $store_ids[] = $store_id;
		// 	}

		// 	// Delete unwanted store
		// 	if (!empty($store_ids)) {

		// 		$unremoved_store_ids = array();

		// 		// get unwanted stores
		// 		$statement = $this->db->prepare("SELECT * FROM `course_to_store` WHERE `store_id` NOT IN (" . implode(',', $store_ids) . ")");
		// 		$statement->execute();
		// 		$unwanted_stores = $statement->fetchAll(PDO::FETCH_ASSOC);
		// 		foreach ($unwanted_stores as $store) {

		// 			$store_id = $store['store_id'];
					
		// 			// Fetch purchase invoice id
		// 		    $statement = $this->db->prepare("SELECT * FROM `product_to_store` as p2s WHERE `store_id` = ? AND `course_id` = ?");
		// 		    $statement->execute(array($store_id, $course_id));
		// 		    $item_available = $statement->fetch(PDO::FETCH_ASSOC);

		// 		     // If item available then store in variable
		// 		    if ($item_available) {
		// 		      $unremoved_store_ids[$item_available['store_id']] = store_field('name', $item_available['store_id']);
		// 		      continue;
		// 		    }

		// 		    // Delete unwanted store link
		// 			$statement = $this->db->prepare("DELETE FROM `course_to_store` WHERE `store_id` = ? AND `course_id` = ?");
		// 			$statement->execute(array($store_id, $course_id));

		// 		}

		// 		if (!empty($unremoved_store_ids)) {

		// 			throw new Exception('The Course belongs to the stores(s) "' . implode(', ', $unremoved_store_ids) . '" has products, so its can not be removed');
		// 		}				
		// 	}
		// }

		// $this->updateStatus($course_id, $data['status']);
		// $this->updateSortOrder($course_id, $data['sort_order']);

    	return $course_id;
	}

	public function getCourseIdByCode($code_name)
	{
		$statement = $this->db->prepare("SELECT `course_id` FROM `courses` WHERE `code_name` = ?");
		$statement->execute(array($code_name));
		$row = $statement->fetch(PDO::FETCH_ASSOC);
		return isset($row['course_id']) ? $row['course_id'] : null;
	}

	public function deleteCourse($course_id) 
	{
    	$statement = $this->db->prepare("DELETE FROM `courses` WHERE `course_id` = ? LIMIT 1");
    	$statement->execute(array($course_id));
        return $course_id;
	}

	public function getCourse($course_id, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		// $statement = $this->db->prepare("SELECT * FROM `courses`
		// 	LEFT JOIN `course_to_store` as b2s ON (`courses`.`course_id` = `b2s`.`course_id`)  
	    // 	WHERE `b2s`.`store_id` = ? AND `courses`.`course_id` = ?");
		$statement = $this->db->prepare("SELECT * FROM `courses`
		WHERE `courses`.`course_id` = ?");
	  	$statement->execute(array($course_id));
	    $course = $statement->fetch(PDO::FETCH_ASSOC);

	    // // Fetch stores related to courses
	    // $statement = $this->db->prepare("SELECT `store_id` FROM `course_to_store` WHERE `course_id` = ?");
	    // $statement->execute(array($course_id));
	    // $all_stores = $statement->fetchAll(PDO::FETCH_ASSOC);
	    // $stores = array();
	    // foreach ($all_stores as $store) {
	    // 	$stores[] = $store['store_id'];
	    // }

	    // $course['stores'] = $stores;

	    return $course;
	}

	public function getCourses($data = array(), $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();

		// $sql = "SELECT * FROM `courses` LEFT JOIN `course_to_store` b2s ON (`courses`.`course_id` = `b2s`.`course_id`) WHERE `b2s`.`store_id` = ? AND `b2s`.`status` = ?";
		$sql = "SELECT * FROM `courses` WHERE `status` = ?";

		if (isset($data['filter_name'])) {
			$sql .= " AND `course_name` LIKE '" . $data['filter_name'] . "%'";
		}

		$sql .= " GROUP BY `courses`.`course_id`";

		$sort_data = array(
			'course_name'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY course_name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$statement = $this->db->prepare($sql);
		// $statement->execute(array($store_id, 1));
		$statement->execute(array(1));

		return $statement->fetchAll(PDO::FETCH_ASSOC);
	}

	public function getSellingPrice($course_id, $from, $to, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();

		$where_query = "`selling_info`.`inv_type` != 'due_paid' AND `selling_item`.`course_id` = ? AND `selling_item`.`store_id` = ?";
		$where_query .= date_range_filter($from, $to);

		$statement = $this->db->prepare("SELECT SUM(`selling_price`.`discount_amount`) as discount, SUM(`selling_price`.`subtotal`) as total FROM `selling_info` 
			LEFT JOIN `selling_item` ON (`selling_info`.`invoice_id` = `selling_item`.`invoice_id`) 
			LEFT JOIN `selling_price` ON (`selling_info`.`invoice_id` = `selling_price`.`invoice_id`) 
			WHERE $where_query");

		$statement->execute(array($course_id, $store_id));
		$invoice = $statement->fetch(PDO::FETCH_ASSOC);

		return (int)($invoice['total'] - $invoice['discount']);
	}

	public function getpurchasePrice($course_id, $from, $to, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();

		$where_query = "`purchase_info`.`inv_type` != 'others' AND `purchase_item`.`course_id` = ? AND `purchase_item`.`store_id` = ?";
		$where_query .= date_range_filter2($from, $to);

		$statement = $this->db->prepare("SELECT SUM(`purchase_price`.`paid_amount`) as total FROM `purchase_info` 
			LEFT JOIN `purchase_item` ON (`purchase_info`.`invoice_id` = `purchase_item`.`invoice_id`) 
			LEFT JOIN `purchase_price` ON (`purchase_info`.`invoice_id` = `purchase_price`.`invoice_id`) 
			WHERE $where_query");
		$statement->execute(array($course_id, $store_id));
		$purchase_price = $statement->fetch(PDO::FETCH_ASSOC);

		return (int)$purchase_price['total'];
	}

	// public function getCourseTree($data = array(), $store_id = null)
	// {
	// 	$tree = array();
	// 	$courses = $this->getCourses($data, $store_id);
	// 	foreach ($courses as $course) {
	// 		$name = '';
	// 		$parent = $this->getCourse($category['parent_id']);
	// 		if (isset($parent['category_id'])) {
	// 			$name = $parent['category_name'] .  ' > ';
	// 		}

	// 		$tree[$category['category_id']] = $name . $category['category_name'];
	// 	}		
	// 	return $tree;
	// }

	// public function getBelongsStore($course_id)
	// {
	// 	$statement = $this->db->prepare("SELECT * FROM `course_to_store` WHERE `course_id` = ?");
	// 	$statement->execute(array($course_id));

	// 	return $statement->fetchAll(PDO::FETCH_ASSOC);

	// }

	public function totalSell($course_id, $from = null, $to = null, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		$where_query = "`selling_info`.`store_id` = $store_id AND `selling_item`.`course_id` = $course_id";
		if (from()) {
			$where_query .= date_range_filter($from, $to);
		}
		$statement = $this->db->prepare("SELECT SUM(`selling_item`.`item_total`) AS total FROM `selling_info` LEFT JOIN `selling_item` ON (`selling_info`.`invoice_id` = `selling_item`.`invoice_id`) WHERE $where_query GROUP BY `selling_item`.`course_id`");
		$statement->execute(array());
		$row = $statement->fetch(PDO::FETCH_ASSOC);
		return isset($row['total']) ? $row['total'] : 0;
	}

	public function totalProduct($course_id, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		$statement = $this->db->prepare("SELECT * FROM `product_to_store` WHERE `store_id` = ? AND `course_id` = ? AND `status` = ?");
		$statement->execute(array($store_id, $course_id, 1));
		return $statement->rowCount();
	}

	public function totalToday($store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		// $where_query = "`b2s`.`store_id` = {$store_id} AND `b2s`.`status` = 1";
		$where_query = "`status` = 1";
		$from = date('Y-m-d');
		$to = date('Y-m-d');
		if (($from && ($to == false)) || ($from == $to)) {
			$day = date('d', strtotime($from));
			$month = date('m', strtotime($from));
			$year = date('Y', strtotime($from));
			$where_query .= " AND DAY(`courses`.`created_at`) = $day";
			$where_query .= " AND MONTH(`courses`.`created_at`) = $month";
			$where_query .= " AND YEAR(`courses`.`created_at`) = $year";
		} else {
			$from = date('Y-m-d H:i:s', strtotime($from.' '. '00:00:00')); 
			$to = date('Y-m-d H:i:s', strtotime($to.' '. '23:59:59'));
			$where_query .= " AND courses.created_at >= '{$from}' AND courses.created_at <= '{$to}'";
		}
		// $statement = $this->db->prepare("SELECT * FROM `courses` LEFT JOIN `course_to_store` b2s ON (`courses`.`course_id` = `b2s`.`course_id`) WHERE $where_query");
		$statement = $this->db->prepare("SELECT * FROM `courses` WHERE $where_query");
		$statement->execute(array());
		return $statement->rowCount();
	}

	public function total($from, $to, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		// $where_query = "`b2s`.`store_id` = {$store_id} AND `b2s`.`status` = 1";
		$where_query = "`status` = 1";
		if ($from) {
			$from = $from ? $from : date('Y-m-d');
			$to = $to ? $to : date('Y-m-d');
			if (($from && ($to == false)) || ($from == $to)) {
				$day = date('d', strtotime($from));
				$month = date('m', strtotime($from));
				$year = date('Y', strtotime($from));
				$where_query .= " AND DAY(`courses`.`created_at`) = $day";
				$where_query .= " AND MONTH(`courses`.`created_at`) = $month";
				$where_query .= " AND YEAR(`courses`.`created_at`) = $year";
			} else {
				$from = date('Y-m-d H:i:s', strtotime($from.' '. '00:00:00')); 
				$to = date('Y-m-d H:i:s', strtotime($to.' '. '23:59:59'));
				$where_query .= " AND courses.created_at >= '{$from}' AND courses.created_at <= '{$to}'";
			}
		}
		// $statement = $this->db->prepare("SELECT * FROM `courses` LEFT JOIN `course_to_store` b2s ON (`courses`.`course_id` = `b2s`.`course_id`) WHERE $where_query");
		$statement = $this->db->prepare("SELECT * FROM `courses` WHERE $where_query");
		$statement->execute(array());
		return $statement->rowCount();
	}
}