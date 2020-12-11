$(function() {
	$("#sidebar-container-toggler").click(function() {
		$("#grid-container")
			.toggleClass("show-sidebar");
		$('.glyphicon', this)
			.toggleClass('glyphicon-chevron-right')
	})
	.click(function() {
		$("#grid-container")
			.toggleClass("hide-sidebar");
		$('.glyphicon', this)
			.toggleClass('glyphicon-chevron-left')
	});
});