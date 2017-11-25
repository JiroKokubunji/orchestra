// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(function () {
  $("#check_all").on('change', function (e) {
    e.preventDefault();
    $('input:checkbox').attr('checked',$(this).is(':checked'));
    return false;
  });

  $("#analyze").click(function (e) {
    e.preventDefault();
    $('input:checkbox').attr('checked','checked');
    $('#process_columns_form').submit();
    return false;
  });

  $("#preprocessing").click(function (e) {
    e.preventDefault();
    var selected = $.map($("input:checkbox:checked"), function (x, i) {return x.value});
    if (selected.length > 0) {
      selected = 'project_datum_columns[id][]=' + selected.join('&project_datum_columns[id][]=');
      window.location.href = '/preprocess_algorithms/select_preprocess_algorithms?' + selected;
    } else {
      alert('Please check at least one column to process.')
    }
    return false;
  });

  $(".column_active_toggle").on('click', function (e) {
    $.post({
      url: '/project_datum_columns/toggle_active',
      data: "project_datum_columns[id]=" + $(e.target).data('project-datum-columns-id'),
      headers: {
        'X-Transaction': 'Active Toggle POST',
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      success: function (data, status) {
        window.location.href=data.redirect_to
      }
    });
    e.preventDefault();
    return false;
  });

  $(".column_target_toggle").on('click', function (e) {
    $.post({
      url: '/project_datum_columns/set_target',
      data: "project_datum_columns[id]=" + $(e.target).data('project-datum-columns-id'),
      headers: {
        'X-Transaction': 'Target Toggle POST',
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      success: function (data, status) {
        window.location.href=data.redirect_to
      }
    });
    e.preventDefault();
    return false;
  });
});
