require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test 'site links' do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  test 'reader links' do
    reader = poets :test_poet

    get root_path
    assert_select 'a[href=?]', signup_path
    assert_select 'a[href=?]', login_path

    log_in_as reader
    get root_path
    assert_select 'a[href=?]', poets_path
    assert_select 'a[href=?]', poet_path( reader )
    assert_select 'a[href=?]', edit_poet_path( reader )
    assert_select 'a[href=?]', logout_path
  end


end
