require 'test_helper'

class MembersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup 
    @member = members(:michael) 
  end 
  
  test "unsuccessful edit" do 
    log_in_as(@member)
    get edit_member_path(@member) 
    assert_template 'members/edit' 
    patch member_path(@member), params: { member: { user_name: "m1ch43l",
                                                    email: "michael@invalid", 
                                                    phone_no: "0495+5",
                                                    password: "foo", 
                                                    password_confirmation: "bar" } } 
    assert_template 'members/edit' 
    assert_select "div", {id: "error_explanation"}
    assert_select "div", {class: "alert alert-danger"}
  end

  test "successful edit with friendly forwarding" do
    get edit_member_path(@member)
    log_in_as(@member)
    assert_redirected_to edit_member_url(@member)
    get edit_member_path(@member) 
    assert_template 'members/edit' 
    user_name = "Michael_1"
    email = "michael1@valid.com"
    phone_no = "+353871110000"
    patch member_path(@member), params: { member: { user_name: user_name, 
                                                    email: email, 
                                                    phone_no: phone_no, 
                                                    password: "", 
                                                    password_confirmation: "" } } 
    assert_not flash.empty? 
    assert_redirected_to @member 
    @member.reload 
    assert_equal user_name, @member.user_name 
    assert_equal email, @member.email 
  end
  
  
end
