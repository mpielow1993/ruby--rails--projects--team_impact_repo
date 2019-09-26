require 'test_helper'

class MembersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
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
  
  test "valid signup information" do 
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
      follow_redirect! 
      assert_template 'members/show'
      assert flash[:success]
      assert_not flash[:danger]
    end
end
