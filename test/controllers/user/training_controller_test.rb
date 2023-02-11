require "test_helper"

class User::TrainingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_training_index_url
    assert_response :success
  end

  test "should get show" do
    get user_training_show_url
    assert_response :success
  end
end
