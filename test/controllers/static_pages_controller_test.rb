require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select 'title', 'Three Word Poems - Home'
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select 'title', 'Three Word Poems - About'
  end

  test "should get styleguide" do
    get static_pages_styleguide_url
    assert_response :success
    assert_select 'title', 'Three Word Poems - Styleguide'
  end

end
