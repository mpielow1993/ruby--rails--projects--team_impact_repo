require 'test_helper'

class ProgrammesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get programmes_new_url
    assert_response :success
  end

  test "should get create" do
    get programmes_create_url
    assert_response :success
  end

  test "should get edit" do
    get programmes_edit_url
    assert_response :success
  end

  test "should get update" do
    get programmes_update_url
    assert_response :success
  end

  test "should get index" do
    get programmes_index_url
    assert_response :success
  end

  test "should get destroy" do
    get programmes_destroy_url
    assert_response :success
  end

end
