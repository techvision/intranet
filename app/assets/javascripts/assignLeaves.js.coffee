$(document).ready ->
  $("#cmbuser").bind 'change', (e) ->
    $.ajax('/users/' + $(this).val() + '/assignleaves', 'html')
