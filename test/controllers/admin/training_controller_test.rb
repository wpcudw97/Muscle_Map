require "test_helper"

class Admin::TrainingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_training_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_training_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_training_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_training_edit_url
    assert_response :success
  end
end
