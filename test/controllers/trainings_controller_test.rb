require "test_helper"

class TrainingsControllerTest < ActionDispatch::IntegrationTest
  test "should get user/index" do
    get trainings_user/index_url
    assert_response :success
  end

  test "should get show" do
    get trainings_show_url
    assert_response :success
  end
end
