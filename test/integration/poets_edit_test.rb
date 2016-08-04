require 'test_helper'

class PoetsEditTest < ActionDispatch::IntegrationTest
  def setup
    @poet = poets(:test_poet)
  end

  test 'unsuccessful edit' do
    log_in_as @poet
    get edit_poet_path @poet

    assert_template 'poets/edit'

    patch poet_path @poet, poet: {
      name: '',
      email: 'name@invalid',
      password: 'foo',
      password_confirmation: 'bar'
    }

    assert_template 'poets/edit'
    assert_select 'form > section > ul > li', count: 4
  end

  test 'successful edit with friendly forwarding' do
    get edit_poet_path @poet
    assert_not_nil session[:forwarding_url]

    log_in_as @poet
    assert_redirected_to edit_poet_path @poet
    assert_nil session[:forwarding_url]

    name = 'Foo Barr'
    email = 'foo@bar.com'
    empty_password = ''
    patch poet_path @poet, poet: {
      name: name,
      email: email,
      password: empty_password,
      password_confirmation: empty_password
    }
    assert_not flash.empty?
    assert_redirected_to @poet

    @poet.reload
    assert_equal name, @poet.name
    assert_equal email, @poet.email
  end
end
