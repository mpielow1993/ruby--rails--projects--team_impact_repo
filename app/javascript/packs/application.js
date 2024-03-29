// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("jquery-ui")
require("custom/sidebar_mechanism")
require("custom/sidebar-container-toggler")
require("custom/search_timetable_form_toggler")
import "bootstrap"
import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.min.css")

document.addEventListener("turbolinks:load", () => {
	flatpickr(".datepicker", {
		altInput: false,
		altFormat: "F j, Y",
		dateFormat: "Y-m-d"
	})
})

$(document).ready(function() {
	$('#main-alert-message').fadeOut(5000);
});
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//datepicker