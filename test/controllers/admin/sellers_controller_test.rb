require "test_helper"

class Admin::SellersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sellers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_sellers_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_sellers_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_sellers_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_sellers_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_sellers_update_url
    assert_response :success
  end
end
