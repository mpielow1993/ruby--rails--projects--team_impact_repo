require 'test_helper'

class StoreItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_items_index_url
    assert_response :success
  end

  test "should get show" do
    get store_items_show_url
    assert_response :success
  end

  test "should get create" do
    get store_items_create_url
    assert_response :success
  end

  test "should get new" do
    get store_items_new_url
    assert_response :success
  end

  test "should get update" do
    get store_items_update_url
    assert_response :success
  end

  test "should get edit" do
    get store_items_edit_url
    assert_response :success
  end

  test "should get delete" do
    get store_items_delete_url
    assert_response :success
  end

end
