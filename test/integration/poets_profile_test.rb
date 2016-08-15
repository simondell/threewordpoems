require 'test_helper'

class PoetsProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @poet = poets :test_poet
  end

  test 'profile display' do
    get poet_path(@poet, page: 1)
    assert_template 'poets/show'
    assert_select 'title', full_title( @poet.name )
    assert_select 'img[src*="gravatar"]'
    assert_match @poet.poems.count.to_s, response.body
    @poet.poems.newest_first.paginate(page: 1).each do |poem|
      assert_match ERB::Util.h(poem.content), response.body
    end
  end
end
