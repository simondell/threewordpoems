require 'test_helper'

class PoetsSignUpTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'Can see sign-up page' do
    get signup_path
    assert_select 'title', full_title('Sign up')
  end

  test 'do not register invalid poet sign-ups' do
    assert_no_difference 'Poet.count' do
      post signup_path, params: {
        poet: {
          name: '',
          email: 'poet@nowhere',
          password: 'nope',
          password_confirmation: 'really',
        }
      }
    end

    assert_select 'form[action="/signup"]'
    assert_select '.field_with_errors'
    assert_select 'form section > h3'
  end

  test 'register valid sign-ups' do
    assert_difference 'Poet.count', 1 do
      post poets_path, params: {
        poet: {
          name: 'Spirit in the Sky',
          email: 'the_best@pla.ce',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size

    poet = assigns(:poet)
    log_in_as poet
    assert_not is_logged_in?

    get edit_account_activation_path('invalid token', email: poet.email)
    assert_not is_logged_in?

    get edit_account_activation_path(poet.activation_token, email: 'wrong')
    assert_not is_logged_in?

    get edit_account_activation_path(poet.activation_token, email: poet.email)
    assert poet.reload.activated?

    follow_redirect!
    assert_template 'poets/show'
    assert is_logged_in?
  end
end
