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
class ModelCollege extends Model 
{
	public function addCollege($data) 
	{
    	$statement = $this->db->prepare("INSERT INTO `colleges` (college_name, code_name, college_details, college_image, created_at) VALUES (?, ?, ?, ?, ?)");
    	$statement->execute(array($data['college_name'], $data['code_name'], $data['college_details'], $data['college_image'], date_time()));
    	$college_id = $this->db->lastInsertId();
    	if (isset($data['college_store'])) {
			foreach ($data['college_store'] as $store_id) {
				$statement = $this->db->prepare("INSERT INTO `college_to_store` SET `college_id` = ?, `store_id` = ?");
				$statement->execute(array((int)$college_id, (int)$store_id));
			}
		}
		$this->updateStatus($college_id, $data['status']);
		$this->updateSortOrder($college_id, $data['sort_order']);
    	return $college_id;   
	}

	public function updateStatus($college_id, $status, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		$statement = $this->db->prepare("UPDATE `college_to_store` SET `status` = ? WHERE `store_id` = ? AND `college_id` = ?");
		$statement->execute(array((int)$status, $store_id, (int)$college_id));
	}

	public function updateSortOrder($college_id, $sort_order, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		$statement = $this->db->prepare("UPDATE `college_to_store` SET `sort_order` = ? WHERE `store_id` = ? AND `college_id` = ?");
		$statement->execute(array((int)$sort_order, $store_id, (int)$college_id));
	}

	public function editCollege($college_id, $data) 
	{
    	$statement = $this->db->prepare("UPDATE `colleges` SET `college_name` = ?, `code_name` = ?, `college_details` = ?, `college_image` = ? WHERE `college_id` = ? ");
    	$statement->execute(array($data['college_name'], $data['code_name'], $data['college_details'], $data['college_image'], $college_id));
		
		// Insert college into store
    	if (isset($data['college_store'])) 
    	{
    		$store_ids = array();
			foreach ($data['college_store'] as $store_id) {
				$statement = $this->db->prepare("SELECT * FROM `college_to_store` WHERE `store_id` = ? AND `college_id` = ?");
			    $statement->execute(array($store_id, $college_id));
			    $college = $statement->fetch(PDO::FETCH_ASSOC);
			    if (!$college) {
			    	$statement = $this->db->prepare("INSERT INTO `college_to_store` SET `college_id` = ?, `store_id` = ?");
					$statement->execute(array((int)$college_id, (int)$store_id));
			    }
			    $store_ids[] = $store_id;
			}

			// Delete unwanted store
			if (!empty($store_ids)) {

				$unremoved_store_ids = array();

				// get unwanted stores
				$statement = $this->db->prepare("SELECT * FROM `college_to_store` WHERE `store_id` NOT IN (" . implode(',', $store_ids) . ")");
				$statement->execute();
				$unwanted_stores = $statement->fetchAll(PDO::FETCH_ASSOC);
				foreach ($unwanted_stores as $store) {

					$store_id = $store['store_id'];
					
					// Fetch purchase invoice id
				    $statement = $this->db->prepare("SELECT * FROM `product_to_store` as p2s WHERE `store_id` = ? AND `college_id` = ?");
				    $statement->execute(array($store_id, $college_id));
				    $item_available = $statement->fetch(PDO::FETCH_ASSOC);

				     // If item available then store in variable
				    if ($item_available) {
				      $unremoved_store_ids[$item_available['store_id']] = store_field('name', $item_available['store_id']);
				      continue;
				    }

				    // Delete unwanted store link
					$statement = $this->db->prepare("DELETE FROM `college_to_store` WHERE `store_id` = ? AND `college_id` = ?");
					$statement->execute(array($store_id, $college_id));

				}

				if (!empty($unremoved_store_ids)) {

					throw new Exception('The College belongs to the stores(s) "' . implode(', ', $unremoved_store_ids) . '" has products, so its can not be removed');
				}				
			}
		}

		$this->updateStatus($college_id, $data['status']);
		$this->updateSortOrder($college_id, $data['sort_order']);

    	return $college_id;
	}

	public function getCollegeIdByCode($code_name)
	{
		$statement = $this->db->prepare("SELECT `college_id` FROM `colleges` WHERE `code_name` = ?");
		$statement->execute(array($code_name));
		$row = $statement->fetch(PDO::FETCH_ASSOC);
		return isset($row['college_id']) ? $row['college_id'] : null;
	}

	public function deleteCollege($college_id) 
	{
    	$statement = $this->db->prepare("DELETE FROM `colleges` WHERE `college_id` = ? LIMIT 1");
    	$statement->execute(array($college_id));
        return $college_id;
	}

	public function getCollege($college_id, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		$statement = $this->db->prepare("SELECT * FROM `colleges`
			LEFT JOIN `college_to_store` as b2s ON (`colleges`.`college_id` = `b2s`.`college_id`)  
	    	WHERE `b2s`.`store_id` = ? AND `colleges`.`college_id` = ?");
	  	$statement->execute(array($store_id, $college_id));
	    $college = $statement->fetch(PDO::FETCH_ASSOC);

	    // Fetch stores related to colleges
	    $statement = $this->db->prepare("SELECT `store_id` FROM `college_to_store` WHERE `college_id` = ?");
	    $statement->execute(array($college_id));
	    $all_stores = $statement->fetchAll(PDO::FETCH_ASSOC);
	    $stores = array();
	    foreach ($all_stores as $store) {
	    	$stores[] = $store['store_id'];
	    }

	    $college['stores'] = $stores;

	    return $college;
	}

	public function getColleges($data = array(), $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();

		$sql = "SELECT * FROM `colleges` LEFT JOIN `college_to_store` b2s ON (`colleges`.`college_id` = `b2s`.`college_id`) WHERE `b2s`.`store_id` = ? AND `b2s`.`status` = ?";

		if (isset($data['filter_name'])) {
			$sql .= " AND `college_name` LIKE '" . $data['filter_name'] . "%'";
		}

		$sql .= " GROUP BY `colleges`.`college_id`";

		$sort_data = array(
			'college_name'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY college_name";
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
		$statement->execute(array($store_id, 1));

		return $statement->fetchAll(PDO::FETCH_ASSOC);
	}

	public function getSellingPrice($college_id, $from, $to, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();

		$where_query = "`selling_info`.`inv_type` != 'due_paid' AND `selling_item`.`college_id` = ? AND `selling_item`.`store_id` = ?";
		$where_query .= date_range_filter($from, $to);

		$statement = $this->db->prepare("SELECT SUM(`selling_price`.`discount_amount`) as discount, SUM(`selling_price`.`subtotal`) as total FROM `selling_info` 
			LEFT JOIN `selling_item` ON (`selling_info`.`invoice_id` = `selling_item`.`invoice_id`) 
			LEFT JOIN `selling_price` ON (`selling_info`.`invoice_id` = `selling_price`.`invoice_id`) 
			WHERE $where_query");

		$statement->execute(array($college_id, $store_id));
		$invoice = $statement->fetch(PDO::FETCH_ASSOC);

		return (int)($invoice['total'] - $invoice['discount']);
	}

	public function getpurchasePrice($college_id, $from, $to, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();

		$where_query = "`purchase_info`.`inv_type` != 'others' AND `purchase_item`.`college_id` = ? AND `purchase_item`.`store_id` = ?";
		$where_query .= date_range_filter2($from, $to);

		$statement = $this->db->prepare("SELECT SUM(`purchase_price`.`paid_amount`) as total FROM `purchase_info` 
			LEFT JOIN `purchase_item` ON (`purchase_info`.`invoice_id` = `purchase_item`.`invoice_id`) 
			LEFT JOIN `purchase_price` ON (`purchase_info`.`invoice_id` = `purchase_price`.`invoice_id`) 
			WHERE $where_query");
		$statement->execute(array($college_id, $store_id));
		$purchase_price = $statement->fetch(PDO::FETCH_ASSOC);

		return (int)$purchase_price['total'];
	}

	public function getBelongsStore($college_id)
	{
		$statement = $this->db->prepare("SELECT * FROM `college_to_store` WHERE `college_id` = ?");
		$statement->execute(array($college_id));

		return $statement->fetchAll(PDO::FETCH_ASSOC);

	}

	public function totalSell($college_id, $from = null, $to = null, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		$where_query = "`selling_info`.`store_id` = $store_id AND `selling_item`.`college_id` = $college_id";
		if (from()) {
			$where_query .= date_range_filter($from, $to);
		}
		$statement = $this->db->prepare("SELECT SUM(`selling_item`.`item_total`) AS total FROM `selling_info` LEFT JOIN `selling_item` ON (`selling_info`.`invoice_id` = `selling_item`.`invoice_id`) WHERE $where_query GROUP BY `selling_item`.`college_id`");
		$statement->execute(array());
		$row = $statement->fetch(PDO::FETCH_ASSOC);
		return isset($row['total']) ? $row['total'] : 0;
	}

	public function totalProduct($college_id, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		$statement = $this->db->prepare("SELECT * FROM `product_to_store` WHERE `store_id` = ? AND `college_id` = ? AND `status` = ?");
		$statement->execute(array($store_id, $college_id, 1));
		return $statement->rowCount();
	}

	public function totalToday($store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		$where_query = "`b2s`.`store_id` = {$store_id} AND `b2s`.`status` = 1";
		$from = date('Y-m-d');
		$to = date('Y-m-d');
		if (($from && ($to == false)) || ($from == $to)) {
			$day = date('d', strtotime($from));
			$month = date('m', strtotime($from));
			$year = date('Y', strtotime($from));
			$where_query .= " AND DAY(`colleges`.`created_at`) = $day";
			$where_query .= " AND MONTH(`colleges`.`created_at`) = $month";
			$where_query .= " AND YEAR(`colleges`.`created_at`) = $year";
		} else {
			$from = date('Y-m-d H:i:s', strtotime($from.' '. '00:00:00')); 
			$to = date('Y-m-d H:i:s', strtotime($to.' '. '23:59:59'));
			$where_query .= " AND colleges.created_at >= '{$from}' AND colleges.created_at <= '{$to}'";
		}
		$statement = $this->db->prepare("SELECT * FROM `colleges` LEFT JOIN `college_to_store` b2s ON (`colleges`.`college_id` = `b2s`.`college_id`) WHERE $where_query");
		$statement->execute(array());
		return $statement->rowCount();
	}

	public function total($from, $to, $store_id = null) 
	{
		$store_id = $store_id ? $store_id : store_id();
		$where_query = "`b2s`.`store_id` = {$store_id} AND `b2s`.`status` = 1";
		if ($from) {
			$from = $from ? $from : date('Y-m-d');
			$to = $to ? $to : date('Y-m-d');
			if (($from && ($to == false)) || ($from == $to)) {
				$day = date('d', strtotime($from));
				$month = date('m', strtotime($from));
				$year = date('Y', strtotime($from));
				$where_query .= " AND DAY(`colleges`.`created_at`) = $day";
				$where_query .= " AND MONTH(`colleges`.`created_at`) = $month";
				$where_query .= " AND YEAR(`colleges`.`created_at`) = $year";
			} else {
				$from = date('Y-m-d H:i:s', strtotime($from.' '. '00:00:00')); 
				$to = date('Y-m-d H:i:s', strtotime($to.' '. '23:59:59'));
				$where_query .= " AND colleges.created_at >= '{$from}' AND colleges.created_at <= '{$to}'";
			}
		}
		$statement = $this->db->prepare("SELECT * FROM `colleges` LEFT JOIN `college_to_store` b2s ON (`colleges`.`college_id` = `b2s`.`college_id`) WHERE $where_query");
		$statement->execute(array());
		return $statement->rowCount();
	}
}