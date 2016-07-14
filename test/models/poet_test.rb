require 'test_helper'

class PoetTest < ActiveSupport::TestCase

  def setup
    @poet = Poet.new name: 'The testing poet', email: 'three_word_tester@threewordpoems.com'
  end

  test 'poet should be valid' do
    assert @poet.valid?
  end

  test 'another_poet should be valid' do
    another_poet = Poet.new
    assert another_poet.valid?
  end
end
