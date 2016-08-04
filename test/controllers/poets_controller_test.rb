require 'test_helper'

class PoetsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @poet = poets(:test_poet)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test 'should redirect edit when not logged in' do
    get edit_poet_path @poet

    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch poet_path @poet, params: { poet: {
      name: @poet.name,
      email: @poet.email
    }}

    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
