require 'test_helper'

class PoemTest < ActiveSupport::TestCase
  def setup
    @poet = poets :test_poet
    @poem = @poet.poems.build title: 'foo', content: 'one two three'
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

  test 'order should be most recent first' do
    most_recent_poem = poems :most_recent
    assert_equal most_recent_poem, Poem.first
  end
end
