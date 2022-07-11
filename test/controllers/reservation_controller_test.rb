require 'test_helper'

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservation_index_url
    assert_response :success
  end

  test "should get show" do
    get reservation_show_url
    assert_response :success
  end

end
