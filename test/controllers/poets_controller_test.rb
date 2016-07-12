require 'test_helper'

class PoetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get poets_new_url
    assert_response :success
  end

end
