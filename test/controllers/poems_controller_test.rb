require 'test_helper'

class PoemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @poem = poems(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Poem.count' do
      post poems_path, params: { poem: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Poem.count' do
      delete poem_path(@poem)
    end
    assert_redirected_to login_url
  end
end
