require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @poet = poets :test_poet
  end

  test 'password resets' do
    get new_password_reset_path
    assert_template 'password_resets/new'
    # invalid email
    post password_resets_path, params: {
      password_reset: {
        email: ''
      }
    }
    assert_not flash.empty?
    assert_template 'password_resets/new'
    # valid email
    post password_resets_path, params: {
      password_reset: {
        email: @poet.email
      }
    }
    assert_not_equal @poet.reset_digest, @poet.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
    # password reset form
    poet = assigns :poet
    # wrong email
    get edit_password_reset_path poet.reset_token, { email: '' }
    assert_redirected_to root_url
    # inactive poet
    poet.toggle! :activated
    get edit_password_reset_path poet.reset_token, { email: poet.email }
    assert_redirected_to root_url
    poet.toggle! :activated
    # right email, wrong token
    get edit_password_reset_path 'wrong token', { email: poet.email }
    assert_redirected_to root_url
    # right email, right token
    get edit_password_reset_path poet.reset_token, { email: poet.email }
    assert_template 'password_resets/edit'
    assert_select 'input[name=email][type=hidden][value=?]', poet.email
    # invalid password & confirmation
    patch password_reset_path(poet.reset_token), params: {
      email: poet.email,
      poet: {
        password: 'foobz',
        password_confirmation: 'sledboke'
      }
    }
    assert flash.empty?
    # empty password
    patch password_reset_path(poet.reset_token), params: {
      email: poet.email,
      poet: {
        password: '',
        password_confirmation: ''
      }
    }
    assert flash.empty?
    # valid password & confirmation
    patch password_reset_path(poet.reset_token), params: {
      email: poet.email,
      poet: {
        password: 'foobaz',
        password_confirmation: 'foobaz'
      }
    }
    assert is_logged_in?
    assert_nil poet.reload.reset_digest
    assert_not flash.empty?
    assert_redirected_to poet
  end

  test 'expired password reset' do
    get new_password_reset_path
    post password_resets_path,
      params: { password_reset: { email: @poet.email } }

    @poet = assigns :poet
    @poet.update_attribute :reset_sent_at, 3.hours.ago
    patch password_reset_path(@poet.reset_token),
      params: {
        email: @poet.email,
        poet: { password: 'foobar', password_confirmation: 'foobar' }
      }
    assert_response :redirect
    follow_redirect!
    assert_match /expired/i, response.body
  end
end
