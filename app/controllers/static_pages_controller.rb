class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def home
  end

  def styleguide
    @example_poet = Poet.new name: 'Crafty Word-Smith', email: 'example@threewordpoems.com'
    @example_poet.poems.build(
      title: 'Poems can have really long titles that fall into the margin-top of the poem they title.',
      content: 'Paragraphs for content',
      created_at: 42.days.ago,
      picture: 'oil.jpg'
    )
  end
end
