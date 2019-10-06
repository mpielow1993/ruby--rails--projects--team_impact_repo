require 'test_helper'

class MembersProfileTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  include ApplicationHelper 
  
  def setup 
    @member = members(:michael) 
  end 
  
  #test "profile display" do 
    #Finding the admin's own newswire posts
    #get member_newswire_posts_path(@member) 
    #assert_select 'title', full_title(@member.first_name + " " + @member.last_name) 
    #assert_select 'h1', @member.first_name + " " + @member.last_name 
    #assert_select 'h1>img.gravatar' 
    #assert_match @member.newswire_posts.count.to_s, response.body
    #assert_select 'div.pagination' 
    #@member.newswire_posts.paginate(page: 1).each do |newswire_post| 
      #assert_match newswire_post.content, response.body 
    #end 
  #end
end
