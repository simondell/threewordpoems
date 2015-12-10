require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
	def setup
		@poet = poets :tutorial
		remember @poet
	end

	test "current_user returns right user when session is nil" do
		assert_equal @poet, current_poet
		assert is_logged_in?
	end

	test "current_user returns nil when remember digest is wrong" do
		token = Poet.digest Poet.new_token
		@poet.update_attribute :remember_digest, token
		assert_nil current_poet
	end
end
