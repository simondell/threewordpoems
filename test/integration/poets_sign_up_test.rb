require 'test_helper'

class PoetsSignUpTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'Can see sign-up page' do
    get signup_path
    assert_select 'title', full_title('Sign up')
  end
end
