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


	   	// this is a hidden input from the assign.html. give it the list of users who have been checked.
	   	// loop through list in controller to ensure the values are there.
		$('input[name="studentidlist"]').val(check_users);

	   	/* run this loop to ensure that the array of usernames for the checked boxes has arrived
		for (i=0;i<check_users .length;i++)
		{
		alert(check_users[i]);
		}
		*/


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
