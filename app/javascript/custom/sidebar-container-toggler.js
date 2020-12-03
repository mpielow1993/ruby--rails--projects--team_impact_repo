$(function() {
	$("#sidebar-container-toggler").click(function() {
		if ($("#main-content-container").hasClass('col-md-8')) {
			$("#side-content-container").remove();
			$(this).removeClass('col-md-8').addClass('col-md-12');
		}
	});
});