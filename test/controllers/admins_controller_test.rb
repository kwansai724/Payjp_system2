require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_index_url
    assert_response :success
  end

  test "should get user_index" do
    get admins_user_index_url
    assert_response :success
  end

  test "should get user_show" do
    get admins_user_show_url
    assert_response :success
  end

end
