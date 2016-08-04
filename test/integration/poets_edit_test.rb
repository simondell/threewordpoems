require 'test_helper'

class PoetsEditTest < ActionDispatch::IntegrationTest
  def setup
    @poet = poets(:test_poet)
  end

  test 'unsuccessful edit' do
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
end
