# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'


# seed Colourways
# although these are production-level so should be in a Rake task.
Colourway.destroy_all

fire = Colourway.create!( {name: "Fire"} )
warning = Colourway.create!( {name: "Warning"} )
ice = Colourway.create!( {name: "Ice"} )
nature = Colourway.create!( {name: "Nature"} )



# seed Categories
Category.destroy_all

ten = Category.create!( {name: "Top ten"} )
aphorism = Category.create!( {name: "Aphorism"} )
mythic = Category.create!( {name: "Mythic"} )



# seed Poets
Poet.destroy_all

Poet.create!([{
	display_name: "Anon E Mousse",
	email: "anon_e_mousse@threewordpoems.com",
	first_name: "Anon",
	last_name: "Mousse"

	},{
	display_name: "The Other Dell",
	email: "simon@theotherdell.com",
	first_name: "Simon",
	last_name: "Dell"
	}])



# seed Poems
Poem.destroy_all
test_poems = [{
  title: "",
  body: "Left foot forward",
  poet_id: Poet.where(first_name: "Anon")[0].id,
  colourway: fire,
  categories: [ten, aphorism]
	},{
  title: "On the importance of dreaming wednesdays",
  body: "Imagination's misty reign",
  poet_id: Poet.where(first_name: "Simon")[0].id,
  colourway: warning,
  categories: [ten, mythic],
  workflow_step: 2
	},{
  title: "Three three three",
  body: "classless cubic repetition",
  poet_id: Poet.where(first_name: "Simon")[0].id,
  colourway: ice,
  categories: [ten],
  workflow_step: 2
	},{
  title: "You know that feeling you get when...",
  body: "Endless public vomitting",
  poet_id: Poet.where(first_name: "Anon")[0].id,
  colourway: nature,
  categories: [ten],
  workflow_step: 2
	},{
  body: "Don't use titles",
  poet_id: Poet.where(first_name: "Anon")[0].id,
  colourway: warning,
  workflow_step: 2
	},{
  body: "Don't title uses",
  poet_id: Poet.where(first_name: "Anon")[0].id,
  colourway: nature,
  workflow_step: 2
	},{
  body: "Met a metaphore",
  poet_id: Poet.where(first_name: "Simon")[0].id,
  colourway: nature,
  workflow_step: 2
	},{
  body: "New house smell",
  poet_id: Poet.where(first_name: "Anon")[0].id,
  colourway: fire,
  workflow_step: 2
	},{
  body: "Free-flowing creativity",
  poet_id: Poet.where(first_name: "Anon")[0].id,
  colourway: warning,
  workflow_step: 2
	},{
  body: "You know it.",
  poet_id: Poet.where(first_name: "Anon")[0].id,
  colourway: ice,
  categories: [mythic],
  workflow_step: 2
	}]

test_poems.each do |poem|
  # lorempixel = open('http://lorempixel.com/1024/690/abstract') do |pixels|
  #   poem.image = pixels
  # end

  Poem.create( poem )
end