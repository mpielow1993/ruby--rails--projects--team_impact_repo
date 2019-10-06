require 'test_helper'

class NewswirePostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup 
    @member = members(:michael) 
    # This code is not idiomatically correct. 
    #@newswire_post = NewswirePost.new(content: "Lorem ipsum", member_id: @member.id) 
    #Idiomatically correct code
    @newswire_post = @member.newswire_posts.build(content: "Lorem ipsum")
  end
  
  test "should be valid" do 
    assert @newswire_post.valid? 
  end 
  
  test "member id should be present" do 
    @newswire_post.member_id = nil 
    assert_not @newswire_post.valid? 
  end
  
  test "content should be present" do 
    @newswire_post.content = " " 
    assert_not @newswire_post.valid? 
  end 
  
  test "content should be at most 300 characters" do 
    @newswire_post.content = "c" * 301 
    assert_not @newswire_post.valid? 
  end
  
  test "order should be most recent first" do 
    assert_equal newswire_posts(:most_recent), NewswirePost.first 
  end
  
  
end
