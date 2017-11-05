// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(function () {
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
