//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){

	var getCheckedStudentList = function(){
		var check_users = [];
		$(".student_checkbox").each(function(){
			if($(this).is(":checked")){
				var userid = $(this).closest("tr").data("userid");
				check_users.push(userid);
			}
		});
		return check_users;
	}

	$("#btnAssign").on("click",function () {
		var studentidList = getCheckedStudentList();
		$('#studentidlist').val(studentidList);
	});

});
  
