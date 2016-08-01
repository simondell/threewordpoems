require 'test_helper'

class PoetLoginTest < ActionDispatch::IntegrationTest

  def setup
    @poet = poets :test_poet
  end

  test "login with valid information then log out" do
    # log in
    get login_path
    post login_path, params: {
      session: {
        email: @poet.email,
        password: 'password'
      }
    }
    assert is_logged_in?
    assert_redirected_to @poet
    follow_redirect!
    assert_template 'poets/show'
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', poet_path(@poet)

    # log out
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', logout_path, count: 0
    assert_select 'a[href=?]', poet_path(@poet), count: 0
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  # remember me tests
  test "login with remembering" do
    log_in_as @poet, remember_me: '1'
    # assert_not_nil cookies['remember_token']
    assert_equal cookies['remember_token'], assigns(:poet).remember_token
  end

  test "login without remembering" do
    log_in_as @poet, remember_me: '0'
    assert_nil cookies['remember_token']
  end
end
