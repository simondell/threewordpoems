require 'test_helper'

class PoemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @poem = poems(:one)
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Poem.count' do
      delete poem_path(@poem)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy for wrong poem' do
    log_in_as poets :test_poet
    poem = poems :some_other_poem
    
    assert_no_difference 'Poem.count' do
      delete poem_path poem
    end
    assert_redirected_to root_url
  end
end
