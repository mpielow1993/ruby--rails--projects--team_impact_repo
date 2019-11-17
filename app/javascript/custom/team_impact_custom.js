/*global $*/
/*global jQuery*/
$(function() {
  $('.list-group-item').on('click', function() {
    $('.glyphicon', this)
      .toggleClass('glyphicon-chevron-right')
      .toggleClass('glyphicon-chevron-down');
  });

});



jQuery(function() {
  // $('#current_member_subscription_id').parent().hide();
  let subscriptions = $('#current_member_subscription_id :selected').html();
  // console.log(subscriptions)
  return subscriptions
});
