require 'test_helper'

class MembersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup 
    ActionMailer::Base.deliveries.clear 
  end
  
  test "invalid sign_up information" do
    get sign_up_path
    assert_no_difference 'Member.count' do 
      post members_path, params: { member: { user_name: "invalid_user_name",
                                             first_name: "", 
                                             last_name: "",
                                             email: "user@invalid",
                                             phone_no: "+1234",
                                             password: "pass", 
                                             password_confirmation: "word" } }
    end
    assert_template 'members/new' 
    assert_select 'div#error_explanation' 
    assert_select 'div.field_with_errors'
  end
  
  #Adding account activation to the user signup test
  
  test "valid signup information with accout activation" do 
    get sign_up_path 
    assert_difference 'Member.count', 1 do 
      post members_path, params: { member: { user_name: "Valid_Username1",
                                             first_name: "Valid", 
                                             last_name: "User",
                                             email: "valid_user1@example.com",
                                             phone_no: "+353870987654",
                                             password: "Password1", 
                                             password_confirmation: "Password1" } } 
      end 
      
      #This code veriﬁes that exactly 1 message was delivered.
      #Because the deliveries array is global, we have to reset it in the setup method to prevent our code from breaking if any other tests deliver email
      assert_equal 1, ActionMailer::Base.deliveries.size 
      
      #'assigns' lets us access instance variables in the corresponding action (in this case, the Members controler's 'create' action, which defines
      #instance variable '@member')
      member = assigns(:member) 
      assert_not member.activated? 
      
      # Try to log in before activation. 
      log_in_as(member) 
      assert_not is_logged_in? 
      
      # Invalid activation token 
      get edit_account_activation_path("invalid token", email: member.email) 
      assert_not is_logged_in? 
      
      # Valid token, wrong email 
      get edit_account_activation_path(member.activation_token, email: 'wrong') 
      assert_not is_logged_in? 
      
      # Valid activation token 
      get edit_account_activation_path(member.activation_token, email: member.email) 
      assert member.reload.activated?
      
      follow_redirect!  #! means raise an exception instead of generate an error 
      #assert_template 'members/show'
      #assert flash[:success]
      #assert_not flash[:danger]
      #assert is_logged_in?
    end
end
