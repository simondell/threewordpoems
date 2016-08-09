require 'test_helper'

class PoemTest < ActiveSupport::TestCase
  def setup
    @poet = poets :test_poet
    @poem = Poem.new title: 'foo', content: 'one two three', poet_id: @poet.id
  end

  test 'should be valid' do
    assert @poem.valid?
  end

  test 'should have a poet id' do
    @poem.poet_id = nil
    assert_not @poem.valid?
  end

  test 'should have content' do
    @poem.content = '   '
    assert_not @poem.valid?
  end
end
