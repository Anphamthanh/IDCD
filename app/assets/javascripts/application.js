// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){

	// Show default section dropdown
	semester_id = $("#semester_id ").find(":selected").val();
	$(".section_select_group#semester_id_" + semester_id).show();

	// When the semester field changes, show the appropriate section div
	$("#semester_id").change(function(){

		// Get the selected semester
		semester_id = $("#semester_id ").find(":selected").val();

		// Hide all section dropdowns
		$(".section_select_group").each(function(){
			console.log(this);
			$(this).hide();
		});

		// Display the section corresponding to the selected semester
		$(".section_select_group#semester_id_" + semester_id).show();

	});

	$("form #current_semester_id").change(function(){
		$(this.form).submit();
	});

});
