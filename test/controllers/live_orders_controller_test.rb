require 'test_helper'

class LiveOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get live_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get live_orders_create_url
    assert_response :success
  end

  test "should get edit" do
    get live_orders_edit_url
    assert_response :success
  end

  test "should get update" do
    get live_orders_update_url
    assert_response :success
  end

  test "should get index" do
    get live_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get live_orders_show_url
    assert_response :success
  end

  test "should get delete" do
    get live_orders_delete_url
    assert_response :success
  end

end
