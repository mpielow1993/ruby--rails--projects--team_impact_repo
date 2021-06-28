$(function() {
	$("#search-timetable-form-container-toggler").click(function() {
		$("#search-timetable-form-container").toggle("slide");
		$('.glyphicon', this)
			.toggleClass('glyphicon-chevron-up')
			.toggleClass('glyphicon-chevron-down');
	});
});