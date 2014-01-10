$(document).ready ->
  $("#cmbuseremail").bind 'change', (e) ->
    $.ajax('/users/' + $(this).val() + '/leave_summary_on_roles', 'html')
