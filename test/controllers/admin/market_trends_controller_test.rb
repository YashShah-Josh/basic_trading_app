require "test_helper"

class Admin::MarketTrendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_market_trends_index_url
    assert_response :success
  end
end
