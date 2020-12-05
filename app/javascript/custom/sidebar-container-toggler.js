$(function() {
	$("#sidebar-container-toggler").click(function() {
		$("#sidebar-container")
			.toggleClass("card layouts _sidebar")
			.toggleClass("card layouts _sidebar hide-sidebar-container");
		$('.glyphicon', this)
			.toggleClass('glyphicon-chevron-right')
			.toggleClass('glyphicon-chevron-left');
	});
});