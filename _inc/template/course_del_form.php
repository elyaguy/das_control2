<h4 class="sub-title">
  <?php echo trans('text_delete_title'); ?>
</h4>
<form class="form-horizontal" id="course-del-form" action="course.php" method="post">
  <input type="hidden" id="action_type" name="action_type" value="DELETE">
  <input type="hidden" id="course_id" name="course_id" value="<?php echo $course['course_id']; ?>">
  <h4 class="box-title text-center">
    <?php echo trans('text_delete_instruction'); ?>
  </h4>
  <div class="box-body">
    <div class="form-group">
      <label for="insert_to" class="col-sm-4 control-label">
        <?php echo trans('label_insert_content_into'); ?>
       </label>
      <div class="col-sm-6">
        <div class="radio">
          <input type="radio" id="insert_to" value="insert_to" name="delete_action" checked="checked">
          <select name="new_course_id" class="form-control">
              <option value="">
                <?php echo trans('text_select'); ?>
               </option>
            <?php foreach (get_courses() as $the_course) : ?>
              <?php if($the_course['course_id'] == $course['course_id']) continue ?>
              <option value="<?php echo $the_course['course_id']; ?>">
                <?php echo $the_course['course_name']; ?>
               </option>
            <?php endforeach; ?>
          </select> 
        </div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-4 control-label"></label>
      <div class="col-sm-6">
        <button id="course-delete" data-form="#course-del-form" data-datatable="#course-course-list" class="btn btn-danger" name="btn_edit_course" data-loading-text="Deleting...">
          <span class="fa fa-fw fa-trash"></span>
          <?php echo trans('button_delete'); ?>
        </button>
      </div>
    </div>
  </div>
</form>