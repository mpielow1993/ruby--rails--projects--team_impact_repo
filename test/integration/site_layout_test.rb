require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "layout links" do 
    
    #Home
    get root_path 
    assert_template 'static_pages/home' 
    assert_select "a[href=?]", root_path 
    assert_select "a[href=?]", about_us_path 
    assert_select "a[href=?]", faq_s_path 
    assert_select "a[href=?]", gym_rules_path 
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", sign_up_path 
    
    #About Us
    get about_us_path
    assert_template 'static_pages/about_us'
    assert_select "title", full_title("About Us")
    
    #Gym Rules
    get gym_rules_path
    assert_template 'static_pages/gym_rules'
    assert_select "title", full_title("Gym Rules")
    
    #FAQ's
    get faq_s_path
    assert_template 'static_pages/faq_s'
    assert_select "title", full_title("Frequently Asked Questions")
    
    #Contact
    get contact_path
    assert_template 'static_pages/contact'
    assert_select "title", full_title("Contact")
    
  end
end
