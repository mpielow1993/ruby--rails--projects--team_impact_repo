require 'test_helper'

class NewswirePostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  #Auhtorisation tests for the newswire_posts controller
  
  def setup 
    @newswire_post = newswire_posts(:check_this_out)
    @member = @newswire_post.member_id
  end 
  
  test "should redirect create when not logged in" do 
    assert_no_difference 'NewswirePost.count' do 
      post member_newswire_posts_path(@member), params: { newswire_post: { content: "Lorem ipsum" } } 
    end 
    assert_redirected_to log_in_url 
  end 
  
  test "should redirect destroy when not logged in" do 
    assert_no_difference 'NewswirePost.count' do 
      delete member_newswire_post_path(@member, @newswire_post) 
    end 
    assert_redirected_to log_in_url 
  end
  
  test "should redirect destroy for wrong newswire_post" do 
    member = members(:michael)
    log_in_as(member) 
    newswire_post = newswire_posts(:ants) 
    assert_no_difference 'NewswirePost.count' do 
      delete member_newswire_post_path(newswire_post.member_id, newswire_post) 
      end 
    assert_redirected_to root_url 
  end
end
