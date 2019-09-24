require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Team Impact MMA Ennis"
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title} | Home"
  end

  test "should get about_us" do
    get about_us_path
    assert_response :success
    assert_select "title", "#{@base_title} | About Us"
  end

  test "should get faq_s" do
    get faq_s_path
    assert_response :success
    assert_select "title", "#{@base_title} | Frequently Asked Questions"
  end

  test "should get gym_rules" do
    get gym_rules_path
    assert_response :success
    assert_select "title", "#{@base_title} | Gym Rules"
  end

  test "should get contact" do 
    get contact_path 
    assert_response :success 
    assert_select "title", "#{@base_title} | Contact"
  end
end
