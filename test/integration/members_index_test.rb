require 'test_helper'

class MembersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  #A test of the members index, including pagination
  
  def setup 
    @admin = members(:michael) 
    @non_admin = members(:john)
  end 
  
  #An integration test for delete links and destroying members
  
  test "index as admin including pagination and delete links" do 
    log_in_as(@admin) 
    get members_path 
    assert_template 'members/index' 
    assert_select 'div.pagination'
    first_page_of_members = Member.paginate(page: 1) 
    first_page_of_members.each do |member| 
      assert_select 'a[href=?]', member_path(member), text: member.first_name + " " + member.last_name 
      unless member == @admin 
        assert_select 'a[href=?]', member_path(member), text: 'Delete' 
      end 
    end 
    assert_difference 'Member.count', -1 do 
      delete member_path(@non_admin) 
    end
  end
  
  test "index as non-admin" do 
    log_in_as(@non_admin) 
    get members_path 
    assert_select 'a', text: 'Delete', count: 0 
  end
end
