require 'test_helper'

class PoetsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @poet = poets :test_poet
  end

  test 'index including pagination' do
    log_in_as @poet
    get poets_path
    assert_template 'poets/index'
    Poet.paginate(page: 1).each do |poet|
      assert_select 'a[href=?]', poet_path( poet ), text: poet.name
    end
  end
end
