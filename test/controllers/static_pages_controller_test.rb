require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'Three Word Poems'
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select 'title', full_title('Home')
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select 'title', full_title('About')
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select 'title', full_title('Contact')
  end

  test "should get styleguide" do
    get styleguide_path
    assert_response :success
    assert_select 'title', full_title('Styleguide')
  end

end
