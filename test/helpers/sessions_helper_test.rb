require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  def setup
    @poet = poets(:test_poet)
    remember @poet
  end

  test 'current_poet returns right poet when session is nil' do
    assert_equal @poet, current_poet
    assert is_logged_in?
  end

  test 'current_poet returns nil if remember_digest is wrong' do
    wrong_digest = Poet.digest Poet.new_token
    @poet.update_attribute :remember_digest, wrong_digest

    assert_nil current_poet
  end
end