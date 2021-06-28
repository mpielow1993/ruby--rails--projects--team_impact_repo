require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full_title_helper" do
    assert_equal full_title(''), "Team Impact MMA Ennis"
    assert_equal full_title("Page Name"), "Team Impact MMA Ennis | Page Name"
  end
end