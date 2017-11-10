// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(function () {
  $("#preprocessing").click(function (e) {
    e.preventDefault();
    var selected = $.map($("input:checkbox:checked"), function (x, i) {return x.value});
    selected = 'project_datum_columns[id][]=' + selected.join('&project_datum_columns[id][]=');
    window.location.href = '/preprocess_algorithms/select_preprocess_algorithms?' + selected;
  });
});
