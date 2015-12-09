require 'test_helper'

class PoetsLoginTest < ActionDispatch::IntegrationTest

	def setup
		@poet = poets :tutorial
	end

	test 'log in with invalid information' do
		get login_path
		assert_template 'sessions/new'

		post login_path, session: { email: '', password: '' }
		assert_template 'sessions/new'
		assert_not flash.empty?

		# TODO: revisit the homepage and how it picks a default category
		#       and then fix these tests
		# get root_path
		# assert flash.empty?
	end

	test "login with valid information" do
		# log in
		get login_path
		post login_path, session: { email: @poet.email, password: 'password' }
		assert is_logged_in?
		assert_redirected_to @poet
		follow_redirect!
		assert_template 'poets/show'
		assert_select "a[href=?]", login_path, count: 0
		assert_select "a[href=?]", logout_path

		# log out
		delete logout_path
		assert_not is_logged_in?
		assert_redirected_to root_url

		# TODO: revisit the homepage and how it picks a default category
		#       and then fix these tests
		# follow_redirect!
		# assert_select "a[href=?]", login_path
		# assert_select "a[href=?]", logout_path,      count: 0
	end

	test "login with remembering" do
		log_in_as @poet, remember_me: '1'
		assert_not_nil cookies['remember_token']
	end

	test "login without remembering" do
		log_in_as @poet, remember_me: '0'
		assert_nil cookies['remember_token']
	end
end
