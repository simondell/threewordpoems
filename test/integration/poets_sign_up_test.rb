require 'test_helper'

class PoetsSignUpTest < ActionDispatch::IntegrationTest

  test 'Can see sign-up page' do
    get signup_path
    assert_select 'title', full_title('Sign up')
  end

  test 'do not register invalid poet sign-ups' do
    assert_no_difference 'Poet.count' do
      post signup_path, { params: {
        poet: {
          name: '',
          email: 'poet@nowhere',
          password: 'nope',
          password_confirmation: 'really',
        }
      }}
    end

    assert_select 'form[action="/signup"]'
    assert_select '.field_with_errors'
    assert_select 'form section > h3'
  end
end
