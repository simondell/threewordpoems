require 'test_helper'

class PoetTest < ActiveSupport::TestCase

  def setup
    @poet = Poet.new({
      name: 'The testing poet',
      email: 'three_word_tester@threewordpoems.com',
      password: 'foobar',
      password_confirmation: 'foobar',
    })
  end

  test 'poet should be valid' do
    assert @poet.valid?
  end


  # name constraints
  test 'name cant be empty' do
    @poet.name = '    '
    assert_not @poet.valid?
  end

  test 'name can\'t be toooooo long' do
    @poet.name = 'Redd Wacky League Antlez Broke the Stereo Neon Tide Bring Back Honesty Coalition Feedback Hand of Aces Keep Going Captain Let’s Pretend Lost State of Dance Paper Taxis Lunar Road Up! Down! Strange! All and I Neon Sheep Eve Hornby Faye Bradley AJ Wilde Michael Rice Dion Watts Matthew Appleyard John Ashurst Lauren Swales Zoe Angus Jaspreet Singh Emma Matthews Nicola Brown Leanne Pickering Victoria Davies Rachel Burnside Gil Parker Freya Watson Alisha Watts James Pearson Jacob Sotheran-Darley Beth Lowery Jasmine Hewitt Chloe Gibson Molly Farquhar Lewis Murphy Abbie Coulson Nick Davies Harvey Parker Kyran Williamson Michael Anderson Bethany Murray Sophie Hamilton Amy Wilkins Emma Simpson Liam Wales Jacob Bartram Alex Hooks Rebecca Miller Caitlin Miller Sean McCloskey Dominic Parker Abbey Sharpe Elena Larkin Rebecca Simpson Nick Dixon Abbie Farrelly Liam Grieves Casey Smith Liam Downing Ben Wignall Elizabeth Hann Danielle Walker Lauren Glen James Johnson Ben Ervine Kate Burton James Hudson Daniel Mayes Matthew Kitching Josh Bennett Evolution Dreams'
    assert_not @poet.valid?
  end


  # email constraints
  test 'email cant be empty' do
    @poet.email = '    '
    assert_not @poet.valid?
  end

  test 'emails validation should accept valid addresses' do
    %w[
      user@example.com
      USER@foo.COM
      A_US-ER@foo.bar.org
      first.last@foo.jp
      alice+bob@baz.cn
    ].each do |valid_address|
      @poet.email = valid_address
      assert @poet.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'emails validation should reject invalid addresses' do
    %w[
      user@example,com
      user_at_foo.org
      user.name@example.
      foo@bar_baz.com
      foo@bar+baz.com
      foo@bar..com
    ].each do |invalid_address|
      @poet.email = invalid_address
      assert_not @poet.valid?, "#{invalid_address.inspect} should not be valid"
    end
  end

  test 'emails should be unique' do
    duplicate_poet = @poet.dup
    duplicate_poet.email = @poet.email.upcase
    @poet.save
    assert_not duplicate_poet.valid?
  end

  test 'emails should be downcased' do
    mixed_cased_email = 'mIxEd_CaSe@EmA.iL'
    @poet.email = mixed_cased_email
    @poet.save
    assert_equal mixed_cased_email.downcase, @poet.reload.email
  end

  # password tests
  test 'password should be present (non-blank)' do
    @poet.password = @poet.password_confirmation = ' ' * 6
    assert_not @poet.valid?
  end

  test 'passwords should be at least 6 characters' do
    @poet.password = @poet.password_confirmation = 'phive'
    assert_not @poet.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @poet.authenticated?(:remember, '')
  end

  # poet/poem tests
  test 'associated poems should be destroyed' do
    @poet.save
    @poet.poems.create content: 'through the veil'

    assert_difference 'Poem.count', -1 do
      @poet.destroy
    end
  end
end
