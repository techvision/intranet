# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#user_manager_id").parent().parent().hide()

  $("#leave_type").hide()
  drop = $("#user_roles").bind 'change', (e) ->
    if $(this).val() == "Employee"
      $("#user_manager_id").parent().parent().show() 
    else
      $("#user_manager_id").parent().parent().hide()

payRole = $('#user_pay_role')
payRole .click ->
  if payRole.is(':checked')
    $("#leave_type").show()
  else
    $("#leave_type").hide()

joinDate = $('#user_join_date')
joinDate.blur ->
  regex = /^(\d{1,2})-([a-zA-Z]{3,})-(\d{4})$/
  m = regex.exec(joinDate.val())
  switch m[2]
    when "January"
      dtMonth = "01"
    when "February"
      dtMonth = "02"
    when "March"
      dtMonth = "03"
    when "April"
      dtMonth = "04"
    when "May"
      dtMonth = "05"
    when "June"
      dtMonth = "06"
    when "July"
      dtMonth = "07"
    when "August"
      dtMonth = "08"
    when "September"
      dtMonth = "09"
    when "October"
      dtMonth = "10"
    when "November"
      dtMonth = "11"
    when "December"
      dtMonth = "12"
  probationDate = new Date(m[3], dtMonth - 1, m[1])
  myVar = new Date(probationDate.setMonth probationDate.getMonth() + 6)  
  # newVar = myVar.toLocaleDateString()
  $('#user_probation_end_date').val(myVar)
