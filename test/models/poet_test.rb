require 'test_helper'

class PoetTest < ActiveSupport::TestCase

  def setup
    @poet = Poet.new name: 'Poet Tester', email: 'nothing@brite.ze'
  end


  test 'should be valid' do
    assert @poet.valid?
  end


  test 'name should be present' do
    @poet.name = '    '

    assert_not @poet.valid?
  end


  test 'email should be present' do
    @poet.email = '    '

    assert_not @poet.valid?
  end


  test 'email should be shorter than 256 characters' do
    @poet.email = 'z' * 244 + '@example.com'

    assert_not @poet.valid?
  end
end
