//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
    $('#myForm').submit(function() {


	    // Get all the forms elements and their values in one step
	    var values = $(this).serialize();
 		
 		/* gets the values of student names that are assigned the homework*/
 		var check_users = [];
	   	$('#myForm tr').filter(':has(:checkbox:checked)').find('.user_name').each(function() {
	    	// this = td element
	    	//alert($(this).html());

	    	check_users.push($(this).text());
		});

		for (i=0;i<check_users .length;i++)
		{
		alert(check_users[i]);
		}


	});
});
  













   /*
    $('#myForm tr').filter(':has(:checkbox:checked)').each(function() {

   		 $('#myForm .user_name').each(function()
		{
  			alert($(this).html());
		});

   	});
	*/
