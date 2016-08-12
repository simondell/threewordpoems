require 'test_helper'

class ContributeAPoemTest < ActionDispatch::IntegrationTest
  test 'poems can be added when no-one is logged in' do
    get new_poem_path
    assert_template 'poems/new'
  end
end
