require 'test_helper'

class PoemsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @poet = poets :test_poet
  end

  test 'poems interface' do
    log_in_as @poet

    assert_redirected_to @poet
    follow_redirect!

    # invalid poem submission
    assert_no_difference 'Poem.count' do
      post poems_path params: { poem: { content: '' } }
    end

    # valid poem submission
    content = 'Ima Valid Pome'
    assert_difference 'Poem.count', 1 do
      post poems_path params: { poem: { content: content } }
    end
    follow_redirect!
    assert_match content, response.body

    # delete poem
    get poet_path @poet
    assert_select 'a', text: 'Delete'
    first_poem = @poet.poems.paginate(page: 1).first
    assert_difference 'Poem.count', -1 do
      delete poem_path first_poem
    end
    
    # visit different poet (no delete links)
    get poet_path poets :lana
    assert_select 'a', text: 'Delete', count: 0
  end
end
