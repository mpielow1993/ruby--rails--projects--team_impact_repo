require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  
  def setup 
    @member = members(:michael) 
    @second_member = members(:john)
  end
  
  test "should get new" do
    get sign_up_path
    assert_response :success
  end
  
  #testing that the 'edit' and 'update' are protected
  test "should redirect edit when not logged in" do 
    get edit_member_path(@member) 
    assert_not flash.empty? 
    assert_redirected_to log_in_url 
  end 
  
  test "should redirect update when not logged in" do 
    patch member_path(@member), params: { member: { user_name: @member.user_name, 
                                                    email: @member.email,
                                                    phone_no: @member.phone_no } } 
    assert_not flash.empty? 
    assert_redirected_to log_in_url 
  end
  
  #Tests for trying to edit as the wrong user
  
  test "should redirect edit when logged in as wrong member" do 
    log_in_as(@second_member) 
    get edit_member_path(@member) 
    assert flash.empty? 
    assert_redirected_to root_url 
  end 
  
  test "should redirect update when logged in as wrong member" do 
    log_in_as(@second_member) 
    patch member_path(@member), params: { member: { user_name: @member.user_name, 
                                                    email: @member.email,
                                                    phone_no: @member.phone_no } }
    assert flash.empty? 
    assert_redirected_to root_url 
  end
  
  #Testing the 'index' action redirect
  
  test "should redirect index when not logged in" do 
    get members_path 
    assert_redirected_to log_in_url 
  end
  
  #Testing that the 'admin' attribute is forbidden
  test "should not allow the admin attribute to be edited via the web" do 
    log_in_as(@second_member) 
    assert_not @second_member.admin? 
    patch member_path(@second_member), params: { member: { password: "Password_2", 
                                                         password_confirmation: "Password_2", 
                                                         admin: true } } 
    assert_not @second_member.admin? 
  end
  
  #Action level tests for admin access control
  test "should redirect destroy when not logged in" do 
    assert_no_difference 'Member.count' do 
      delete member_path(@member) 
    end 
    assert_redirected_to log_in_url 
  end 
  
  test "should redirect destroy when logged in as a non-admin" do 
    log_in_as(@second_member) 
    assert_no_difference 'Member.count' do
      delete member_path(@member) 
    end 
    assert_redirected_to root_url 
  end

end
