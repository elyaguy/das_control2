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
if (user_group_id() != 1 && !has_permission('access', 'read_course')) {
  header('HTTP/1.1 422 Unprocessable Entity');
  header('Content-Type: application/json; charset=UTF-8');
  echo json_encode(array('errorMsg' => trans('error_read_permission')));
  exit();
}

// LOAD SUPPLIER MODEL
$course_model = registry()->get('loader')->model('course');

// Validate post data
function validate_request_data($request)
{
  // Validate course name
  if (!validateString($request->post['course_name'])) {
    throw new Exception(trans('error_course_name'));
  }

  // Validate course code name
  if (!validateString($request->post['code_name'])) {
    throw new Exception(trans('error_code_name'));
  }

  // Validate course slug
  if (!validateString($request->post['code_name'])) {
    throw new Exception(trans('error_code_name'));
  }

  // Validate store
  // if (!isset($request->post['course_store']) || empty($request->post['course_store'])) {
  //   throw new Exception(trans('error_store'));
  // }

  // Validate status
  if (!is_numeric($request->post['status'])) {
    throw new Exception(trans('error_status'));
  }

  // Validate sort order
//   if (!is_numeric($request->post['sort_order'])) {
//     throw new Exception(trans('error_sort_order'));
//   }
 }

// Check, if already exist or not
function validate_existance($request, $id = 0)
{


  // Check, if course name exist or not
  $statement = db()->prepare("SELECT * FROM `courses` WHERE (`course_name` = ? OR `code_name` = ?) AND `course_id` != ?");
  $statement->execute(array($request->post['course_name'], $request->post['code_name'], $id));
  if ($statement->rowCount() > 0) {
    throw new Exception(trans('error_course_exist'));
  }
}

// Create course
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['action_type']) && $request->post['action_type'] == 'CREATE') {
  try {

    // Check create permission
    if (user_group_id() != 1 && !has_permission('access', 'create_course')) {
      throw new Exception(trans('error_create_permission'));
    }

    // Validate post data
    validate_request_data($request);

    // Validate existance
    validate_existance($request);

    $statement = db()->prepare("SELECT * FROM `courses` WHERE (`code_name` = ? OR `course_name` = ?)");
    $statement->execute(array($request->post['code_name'], $request->post['course_name']));
    $total = $statement->rowCount();
    if ($total > 0) {
      throw new Exception(trans('error_course_exist'));
    }

    $Hooks->do_action('Before_Create_Course', $request);

    // Insert course into database
    $course_id = $course_model->addCourse($request->post);

    // get course info
    $course = $course_model->getCourse($course_id);

    $Hooks->do_action('After_Create_Course', $course);

    // SET OUTPUT CONTENT TYPE
    header('Content-Type: application/json');
    echo json_encode(array('msg' => trans('text_success'), 'id' => $course_id, 'course' => $course));
    exit();
  } catch (Exception $e) {

    header('HTTP/1.1 422 Unprocessable Entity');
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode(array('errorMsg' => $e->getMessage()));
    exit();
  }
}

// Update course
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['action_type']) && $request->post['action_type'] == 'UPDATE') {
  try {

    // Check update permission
    if (user_group_id() != 1 && !has_permission('access', 'update_course')) {
      throw new Exception(trans('error_update_permission'));
    }

    // Validate product id
    if (empty($request->post['course_id'])) {
      throw new Exception(trans('error_course_id'));
    }

    $id = $request->post['course_id'];

    // Validate post data
    validate_request_data($request);

    // Validate existance
    validate_existance($request, $id);

    $Hooks->do_action('Before_Update_Course', $request);

    // Edit course
    $course = $course_model->editCourse($id, $request->post);

    $Hooks->do_action('After_Update_Course', $course);

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

// Delete course
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['action_type']) && $request->post['action_type'] == 'DELETE') {
  try {

    // Check delete permission
    if (user_group_id() != 1 && !has_permission('access', 'delete_course')) {
      throw new Exception(trans('error_delete_permission'));
    }

    // Validate course id
    if (empty($request->post['course_id'])) {
      throw new Exception(trans('error_course_id'));
    }

    $id = $request->post['course_id'];
    $new_course_id = $request->post['new_course_id'];

    // Validate delete action
    if (empty($request->post['delete_action'])) {
      throw new Exception(trans('error_delete_action'));
    }

    if ($request->post['delete_action'] == 'insert_to' && empty($new_course_id)) {
      throw new Exception(trans('error_course_name'));
    }

    $Hooks->do_action('Before_Delete_Course', $request);

    // $belongs_stores = $course_model->getBelongsStore($id);
    // foreach ($belongs_stores as $the_store) {

    //   // Check if relationship exist or not
    //   $statement = db()->prepare("SELECT * FROM `course_to_store` WHERE `course_id` = ? AND `store_id` = ?");
    //   $statement->execute(array($new_course_id, $the_store['store_id']));
    //   if ($statement->rowCount() > 0) continue;

    //   // Create relationship
    //   $statement = db()->prepare("INSERT INTO `course_to_store` SET `course_id` = ?, `store_id` = ?");
    //   $statement->execute(array($new_course_id, $the_store['store_id']));
    // }

    if ($request->post['delete_action'] == 'insert_to') {
      $statement = db()->prepare("UPDATE `holding_item` SET `course_id` = ? WHERE `course_id` = ?");
      $statement->execute(array($new_course_id, $id));

      $statement = db()->prepare("UPDATE `quotation_item` SET `course_id` = ? WHERE `course_id` = ?");
      $statement->execute(array($new_course_id, $id));

      $statement = db()->prepare("UPDATE `product_to_store` SET `course_id` = ? WHERE `course_id` = ?");
      $statement->execute(array($new_course_id, $id));

      $statement = db()->prepare("UPDATE `selling_item` SET `course_id` = ? WHERE `course_id` = ?");
      $statement->execute(array($new_course_id, $id));
    }

    // Delete course
    $course = $course_model->deleteCourse($id);

    $Hooks->do_action('After_Delete_Course', $course);

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

// course create form
if (isset($request->get['action_type']) && $request->get['action_type'] == 'CREATE') {
  $Hooks->do_action('Before_Course_Create_Form');
  include 'template/course_create_form.php';
  $Hooks->do_action('After_Course_Create_Form');
  exit();
}

// course edit form
if (isset($request->get['course_id']) && isset($request->get['action_type']) && $request->get['action_type'] == 'EDIT') {

  // Fetch course info
  $course = $course_model->getCourse($request->get['course_id']);
  $Hooks->do_action('Before_Course_Edit_Form', $course);
  include 'template/course_form.php';
  $Hooks->do_action('After_Course_Edit_Form', $course);
  exit();
}

// course delete form
if (isset($request->get['course_id']) && isset($request->get['action_type']) && $request->get['action_type'] == 'DELETE') {

  // Fetch course info
  $course = $course_model->getCourse($request->get['course_id']);
  $Hooks->do_action('Before_Course_Delete_Form');
  include 'template/course_del_form.php';
  $Hooks->do_action('Before_Course_Delete_Form');
  exit();
}

/**
 *===================
 * START DATATABLE
 *===================
 */
$Hooks->do_action('Before_Showing_Course_List');

$where_query = ''; //'b2s.store_id = ' . store_id();

// DB table to use
// $table = "(SELECT courses.*, b2s.status, b2s.sort_order FROM courses 
//   LEFT JOIN course_to_store b2s ON (courses.course_id = b2s.course_id) 
//   WHERE $where_query GROUP by courses.course_id
//   ) as courses";

$table = "(SELECT courses.* FROM courses 
  GROUP by courses.course_id
  ) as courses";

// Table's primary key
$primaryKey = 'course_id';

$columns = array(
  array(
    'db' => 'course_id',
    'dt' => 'DT_RowId',
    'formatter' => function ($d, $row) {
      return 'row_' . $d;
    }
  ),
  array('db' => 'course_id', 'dt' => 'course_id'),
  array(
    'db' => 'course_name',
    'dt' => 'course_name',
    'formatter' => function ($d, $row) {
      return ucfirst($row['course_name']);
    }
  ),
  array('db' => 'code_name',   'dt' => 'code_name'),
  array(
    'db' => 'course_id',
    'dt' => 'total_product',
    'formatter' => function ($d, $row) {
      return total_product_of_course($row['course_id']);
    }
  ),
  array(
    'db' => 'status',
    'dt' => 'status',
    'formatter' => function ($d, $row) {
      return $row['status']
        ? '<span class="label label-success">' . trans('text_active') . '</span>'
        : '<span class="label label-warning">' . trans('text_inactive') . '</span>';
    }
  ),
  array(
    'db' => 'course_id',
    'dt' => 'btn_view',
    'formatter' => function ($d, $row) {
      return '<a id="view-course" class="btn btn-sm btn-block btn-info" href="course_profile.php?course_id=' . $row['course_id'] . '" title="' . trans('button_view_profile') . '"><i class="fa fa-fw fa-user"></i></a>';
    }
  ),
  array(
    'db' => 'course_id',
    'dt' => 'btn_edit',
    'formatter' => function ($d, $row) {
      if (DEMO && $row['course_id'] == 1) {
        return '<button class="btn btn-sm btn-block btn-default" type="button" disabled><i class="fa fa-pencil"></i></button>';
      }
      return '<button id="edit-course" class="btn btn-sm btn-block btn-primary" type="button" title="' . trans('button_edit') . '"><i class="fa fa-fw fa-pencil"></i></button>';
    }
  ),
  array(
    'db' => 'course_id',
    'dt' => 'btn_delete',
    'formatter' => function ($d, $row) {
      if (DEMO && $row['course_id'] == 1) {
        return '<button class="btn btn-sm btn-block btn-default" type="button" disabled><i class="fa fa-trash"></i></button>';
      }
      return '<button id="delete-course" class="btn btn-sm btn-block btn-danger" type="button" title="' . trans('button_delete') . '"><i class="fa fa-fw fa-trash"></i></button>';
    }
  )
);


// debug_to_console($request);
// debug_to_console($sql_details);
// debug_to_console($columns);
// debug_to_console($primaryKey);
// debug_to_console($columns);
// debug_to_console($request);

echo json_encode(
  SSP::simple($request->get, $sql_details, $table, $primaryKey, $columns)
);

$Hooks->do_action('After_Showing_Course_List');

/**
 *===================
 * END DATATABLE
 *===================
 */

function debug_to_console($data)
{
  $output = $data;
  if (is_array($output))
    $output = implode(',', $output);

  echo "<script>console.log('Debug Objects: " . $output . "' );</script>";
}

// function total_product_of_course2($course_id)
// {
	
// 	$course_model = registry()->get('loader')->model('course');
// 	return $course_model->totalProduct($course_id);

// }