require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'Three Word Poems -'
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select 'title', "#{@base_title} About"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select 'title', "#{@base_title} Home"
  end

  test "should get styleguide" do
    get static_pages_styleguide_url
    assert_response :success
    assert_select 'title', "#{@base_title} Styleguide"
  end

end
