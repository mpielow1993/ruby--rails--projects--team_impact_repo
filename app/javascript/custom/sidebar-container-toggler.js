$(function() {
	$("#sidebar-container-toggler").click(function(e) {
		e.preventDefault();
		$("#grid-container")
			.toggleClass("show-sidebar");
		$('.glyphicon', this)
			.toggleClass('glyphicon-chevron-right')
	})
	.click(function(e) {
		e.preventDefault();
		$("#grid-container")
			.toggleClass("hide-sidebar");
		$('.glyphicon', this)
			.toggleClass('glyphicon-chevron-left')
	});
});