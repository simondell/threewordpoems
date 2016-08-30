require 'test_helper'

class Admin::PoemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_poems_index_url
    assert_response :success
  end

  test "should get update" do
    get admin_poems_update_url
    assert_response :success
  end

end
