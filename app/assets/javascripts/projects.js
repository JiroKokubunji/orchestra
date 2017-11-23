// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(function () {
  // new
  $("#new_project_file_upload_box").on('dragleave', function (e) {
    e.preventDefault();
    $(this).css('border', 'solid 3px #a0a0a0')
  });
  $("#new_project_file_upload_box").on('dragover', function (e) {
    e.preventDefault();
    $(this).css('border', 'dotted 3px #a0a0a0')
  });
  $("#new_project_file_upload_box").on('drop', function (e) {
    e.preventDefault();
    // only support one file
    $("#upload_file")[0].files[0] = e.originalEvent.dataTransfer.files[0];
    $("form").submit();
    return false;
  });
  // show
  $(".js-project-datum-row").on('click', function (e) {
    var project_datum_id = $(this).data('project-datum-id');
    window.location.href = '/project_data/' + project_datum_id;
    return false;
  });
  // index
  $(".js-project-row").on('click', function (e) {
    var project_id = $(this).data('project-id');
    window.location.href = '/projects/' + project_id;
    return false;
  });


  // edit
  $(".edit_project").click(function () {
    var project_id = $(this).data("project_id");
    var url = "projects/" + project_id + "/edit";
    $("#project_edit_modal").find('.modal-body').load(url);
  });
  $("#go_predict").click(function () {
    var preprocessed_datum_id = $(this).data("preprocessed_datum_id");
    var url = "/algorithms/";
    $("#go_predict_modal").find('.modal-body').load(url);
  });
});
