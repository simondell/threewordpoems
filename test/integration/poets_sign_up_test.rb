require 'test_helper'

class PoetsSignUpTest < ActionDispatch::IntegrationTest

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
      post signup_path, params: {
        poet: {
          name: 'Spirit in the Sky',
          email: 'the_best@pla.ce',
          password: 'spritualsky',
          password_confirmation: 'spritualsky'
        }
      }
    end
    follow_redirect!
    assert_template 'poets/show'
    assert_not flash.empty?
    assert is_logged_in?
  end
end
