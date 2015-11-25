require 'test_helper'

class PoetsLoginTest < ActionDispatch::IntegrationTest

	def setup
		@poet = poets(:tutorial)
	end

	test 'log in with invalid information' do
		get login_path
		assert_template 'sessions/new'

		post login_path, session: { email: '', password: '' }
		assert_template 'sessions/new'
		assert_not flash.empty?

		get root_path
		assert flash.empty?
	end

  test "login with valid information" do
    get login_path
    post login_path, session: { email: @poet.email, password: 'password' }
    assert_redirected_to @poet
    follow_redirect!
    assert_template 'poets/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert is_logged_in?
  end

end
