require "test_helper"

class Users::EvaluationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_evaluations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get users_evaluations_destroy_url
    assert_response :success
  end
end
