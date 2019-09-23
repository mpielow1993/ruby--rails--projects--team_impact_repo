require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Team Impact MMA Ennis"
  end
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "#{@base_title} | Home"
  end

  test "should get about_us" do
    get static_pages_about_us_url
    assert_response :success
    assert_select "title", "#{@base_title} | About Us"
  end

  test "should get faq_s" do
    get static_pages_faq_s_url
    assert_response :success
    assert_select "title", "#{@base_title} | FAQ's"
  end

  test "should get gym_rules" do
    get static_pages_gym_rules_url
    assert_response :success
    assert_select "title", "#{@base_title} | Gym Rules"
  end

end
