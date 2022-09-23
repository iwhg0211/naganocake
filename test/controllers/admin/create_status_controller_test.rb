require "test_helper"

class Admin::CreateStatusControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_create_status_update_url
    assert_response :success
  end
end
