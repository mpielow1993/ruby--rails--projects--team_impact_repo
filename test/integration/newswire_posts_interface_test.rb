require 'test_helper'

class NewswirePostsInterfaceTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup 
    @member = members(:michael) 
  end 
  
  test "newswire_post interface" do 
    log_in_as(@member) 
    get newswire_path 
    assert_select 'div.pagination' 
    assert_select 'input[type=file]'
    
    # Invalid submission 
    assert_no_difference 'NewswirePost.count' do 
      post member_newswire_posts_path(@member), params: { newswire_post: { content: "" } } 
    end 
    assert_select 'div#error_explanation' 
    #assert_select 'a[href=?]', '/?page=1' # Correct pagination link 
    #assert_redirected_to newswire_url
    
    # Valid submission 
    #content = "This is valid NewswirePost content"
    #image = fixture_file_upload('test/fixtures/kitten.jpg', 'image/jpeg')
    #assert_difference 'NewswirePost.count', 1 do 
      #post member_newswire_posts_path(@member), params: { newswire_post: { content: content, image: image } } 
    #end 
    #assert newswire_post.image.attached?
    #assert_redirected_to newswire_url 
    #follow_redirect! 
    #assert_match content, response.body 
    
    # Delete post 
    assert_select 'a', text: 'Delete' 
    first_newswire_post = @member.newswire_posts.paginate(page: 1).first 
    assert_difference 'NewswirePost.count', -1 do 
      delete member_newswire_post_path(@member, first_newswire_post) 
    end 
    
    # Visit different member (no delete links) 
    get member_newswire_posts_path(members(:jim)) 
    assert_select 'a', text: 'Delete', count: 0 
    end
end
