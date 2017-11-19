// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(function () {
  $("#preprocessing").click(function (e) {
    e.preventDefault();
    var selected = $.map($("input:checkbox:checked"), function (x, i) {return x.value});
    selected = 'project_datum_columns[id][]=' + selected.join('&project_datum_columns[id][]=');
    window.location.href = '/preprocess_algorithms/select_preprocess_algorithms?' + selected;
    return false;
  });

  var active_toggle = function () {
      $(".column_active_toggle").on('click', function (e) {
      $.post({
        url: '/project_datum_columns/toggle_active',
        data: "project_datum_columns[id]=" + $(e.target).data('project-datum-columns-id'),
        headers: {
          'X-Transaction': 'POST Example',
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
      });
      e.preventDefault();
      return false;
    });
  };

  var set_target = function () {
      $(".column_target_toggle").on('click', function (e) {
      $.post({
        url: '/project_datum_columns/set_target',
        data: "project_datum_columns[id]=" + $(e.target).data('project-datum-columns-id'),
        headers: {
          'X-Transaction': 'POST Example',
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
      });
      e.preventDefault();
      return false;
    });
  };
  $(document).on('turbolinks:load', function () {
    // when turbolinks as well
    set_target()
    active_toggle();
  });
  set_target()
  active_toggle();
});
