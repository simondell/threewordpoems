require 'test_helper'

class PoetsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @editor = poets :test_poet
    @non_editor = poets :archer
  end

  test 'index including pagination' do
    log_in_as @editor
    get poets_path
    assert_template 'poets/index'
    Poet.paginate(page: 1).each do |poet|
      assert_select 'a[href=?]', poet_path( poet ), text: poet.name
      unless poet == @editor
        assert_select 'a[href=?]', poet_path( poet ), text: 'cull'
      end
    end

    assert_difference 'Poet.count', -1 do
      delete poet_path(@non_editor)
    end
  end
end
