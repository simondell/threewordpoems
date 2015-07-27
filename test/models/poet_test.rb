require 'test_helper'

class PoetTest < ActiveSupport::TestCase

  def setup
    @poet = Poet.new name: 'Poet Tester', email: 'nothing@brite.ze'
  end


  test 'should be valid' do
    assert @poet.valid?
  end


  test 'name should be present' do
    @poet.name = '    '

    assert_not @poet.valid?
  end


  test 'email should be present' do
    @poet.email = '    '

    assert_not @poet.valid?
  end


  test 'email should be shorter than 256 characters' do
    @poet.email = 'z' * 244 + '@example.com'

    assert_not @poet.valid?
  end


  test 'email should accept valid email addresses' do
    valid_addresses = %w[
      user@example.com
      USER@foo.COM
      A_US-ER@foo.bar.org
      first.last@foo.jp
      alice+bob@baz.cn
    ]

    valid_addresses.each do |valid_address|
      @poet.email = valid_address

      assert @poet.valid?, '${valid_address.inspect} should be valid'
    end
  end


  test 'email should refuse invalid email addresses' do
    invalid_addresses = %w[
      user@example,com
      user@example..com
      user_at_foo.org
      user.name@example.
      foo@bar_baz.com
      foo@bar+baz.com
      foo@bar+baz.com
    ]

    invalid_addresses.each do |invalid_address|
      @poet.email = invalid_address

      assert_not @poet.valid?, '${invalid_address.inspec} should be invalid'
    end
  end


  test 'email addresses should be case-insensitively unique' do
    cloned_poet = @poet.dup
    cloned_poet.email = @poet.email.upcase
    @poet.save

    assert_not cloned_poet.valid?
  end
end
