require 'test_helper'

class PoetTest < ActiveSupport::TestCase

  def setup
    @poet = Poet.new name: 'The testing poet', email: 'three_word_tester@threewordpoems.com'
  end

  test 'poet should be valid' do
    assert @poet.valid?
  end

  # test 'another_poet should be valid' do
  #   another_poet = Poet.new
  #   assert another_poet.valid?
  # end

  # name constraints
  test 'poet.name cant be empty' do
    @poet.name = '    '
    assert_not @poet.valid?
  end

  test 'name can\'t be toooooo long' do
    @poet.name = 'Redd Wacky League Antlez Broke the Stereo Neon Tide Bring Back Honesty Coalition Feedback Hand of Aces Keep Going Captain Let’s Pretend Lost State of Dance Paper Taxis Lunar Road Up! Down! Strange! All and I Neon Sheep Eve Hornby Faye Bradley AJ Wilde Michael Rice Dion Watts Matthew Appleyard John Ashurst Lauren Swales Zoe Angus Jaspreet Singh Emma Matthews Nicola Brown Leanne Pickering Victoria Davies Rachel Burnside Gil Parker Freya Watson Alisha Watts James Pearson Jacob Sotheran-Darley Beth Lowery Jasmine Hewitt Chloe Gibson Molly Farquhar Lewis Murphy Abbie Coulson Nick Davies Harvey Parker Kyran Williamson Michael Anderson Bethany Murray Sophie Hamilton Amy Wilkins Emma Simpson Liam Wales Jacob Bartram Alex Hooks Rebecca Miller Caitlin Miller Sean McCloskey Dominic Parker Abbey Sharpe Elena Larkin Rebecca Simpson Nick Dixon Abbie Farrelly Liam Grieves Casey Smith Liam Downing Ben Wignall Elizabeth Hann Danielle Walker Lauren Glen James Johnson Ben Ervine Kate Burton James Hudson Daniel Mayes Matthew Kitching Josh Bennett Evolution Dreams'
    assert_not @poet.valid?
  end

  # email constraints
  test 'poet.email cant be empty' do
    @poet.email = '    '
    assert_not @poet.valid?
  end
end
