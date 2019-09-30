require 'test_helper'

class MembersLogInTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @member = members(:michael)
  end
  
  test "log in with valid information then log out" do 
    get log_in_path
    assert_template 'sessions/new' 
    post log_in_path, params: { session: { user_name: @member.user_name, password: "Password_1" } } 
    assert_redirected_to @member
    follow_redirect!
    assert_template 'members/show' 
    assert is_logged_in?
    assert_select "a[href=?]", log_in_path, count: 0 
    assert_select "a[href=?]", log_out_path 
    assert_select "a[href=?]", member_path(@member)
    delete log_out_path
    assert_not is_logged_in?
    assert_redirected_to root_url 
    follow_redirect! 
    assert_select "a[href=?]", log_in_path 
    assert_select "a[href=?]", log_out_path, count: 0 
    assert_select "a[href=?]", member_path(@member), count: 0 
  end
  
  test "log in with invalid information" do 
    get log_in_path
    assert_template 'sessions/new' 
    post log_in_path, params: { session: { user_name: @member.user_name, password: "invalid" } } 
    assert_not is_logged_in?
    assert_template 'sessions/new' 
    assert_not flash.empty? 
    get root_path 
    assert flash.empty? 
  end
end
