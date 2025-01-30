require "test_helper"

class Admin::TradesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_trades_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_trades_show_url
    assert_response :success
  end
end
