require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full_title helper' do
    assert_equal full_title, 'Three Word Poems'
    assert_equal full_title('PAGE TITLE'), 'Three Word Poems - PAGE TITLE'
  end
end