$A.bind(window, 'load', function(){

	// Syntax : setCalendar( ID , TriggeringElement , TargetEditField , EnableComments , clickHandler , config )

	// Basic calendar with comment editing disabled

	$A.setCalendar('BasicCalendar', $A.getEl('imgCalendar1'), $A.getEl('user_join_date'), false, function(ev, dc, targ)
{
		// Return the desired date string
		targ.value = dc.range.current.mDay + '-' + dc.range[dc.range.current.month].name + '-' +  dc.range.current.year;
		// Then close the date picker
		dc.close();
	});

});
