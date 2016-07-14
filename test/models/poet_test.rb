require 'test_helper'

class PoetTest < ActiveSupport::TestCase

  def setup
    @poet = Poet.new name: 'The testing poet', email: 'three_word_tester@threewordpoems.com'
  end

  test 'should be valid' do
    assert @poet.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
