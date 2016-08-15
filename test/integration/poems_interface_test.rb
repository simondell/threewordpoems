require 'test_helper'

class PoemsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @poet = poets :test_poet
  end

  test 'poems interface' do
    log_in_as @poet

    assert_redirected_to @poet
    follow_redirect!

    get new_poem_path
    assert_select 'input[type=text]', count: 2
    assert_select 'input[type=file]'

    # invalid poem submission
    assert_no_difference 'Poem.count' do
      post poems_path, params: { poem: { content: '' } }
    end

    # valid poem submission
    content = 'Ima Valid Pome'
    picture = fixture_file_upload 'test/fixtures/files/cats-q-c-640-480-1.jpg', 'image/jpeg'
    assert_difference '@poet.poems.count', 1 do
      post poems_path, params: { poem: { content: content, picture: picture } }
    end
    follow_redirect!
    assert @poet.poems.lacigolonorhc.first.picture?
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
