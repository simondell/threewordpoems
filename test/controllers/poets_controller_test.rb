require 'test_helper'

class PoetsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @test_poet_1 = poets :test_poet
    @test_poet_2 = poets :archer
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test 'should redirect edit when not logged in' do
    get edit_poet_path @test_poet_1

    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect index when not logged in' do
    get poets_path
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch poet_path @test_poet_1, params: { poet: {
      name: @test_poet_1.name,
      email: @test_poet_1.email
    }}

    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect edit when logged in as wrong poet' do
    log_in_as @test_poet_2
    get edit_poet_path @test_poet_1

    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect update when logged in as wrong poet' do
    log_in_as @test_poet_2
    patch poet_path @test_poet_1, params: { poet: {
      name: @test_poet_1.name,
      email: @test_poet_1.email
    }}

    assert flash.empty?
    assert_redirected_to root_url
  end
end
