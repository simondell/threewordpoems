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
	name: "Anon",
	email: "anon_e_mousse@threewordpoems.com",
	password: "anonandon",
	password_confirmation: "anonandon"
},{
	name: "The Other Dell",
	email: "simon@theotherdell.com",
	password: 'simonsimon',
	password_confirmation: 'simonsimon'
}])

anon = Poet.first
simon = Poet.second


# seed Poems
Poem.destroy_all
test_poems = [{
  title: "",
  body: "Left foot forward",
  poet: anon,
  colourway: fire,
  categories: [ten, aphorism]
	},{
  title: "On the importance of dreaming wednesdays",
  body: "Imagination's misty reign",
  poet: simon,
  colourway: warning,
  categories: [ten, mythic],
  workflow_step: 2
	},{
  title: "Three three three",
  body: "classless cubic repetition",
  poet: simon,
  colourway: ice,
  categories: [ten],
  workflow_step: 2
	},{
  title: "You know that feeling you get when...",
  body: "Endless public vomitting",
  poet: anon,
  colourway: nature,
  categories: [ten],
  workflow_step: 2
	},{
  title: "",
  body: "Don't use titles",
  poet: anon,
  colourway: warning,
  workflow_step: 2
	},{
  title: "",
  body: "Don't title uses",
  poet: anon,
  colourway: nature,
  workflow_step: 2
	},{
  title: "",
  body: "Met a metaphore",
  poet: simon,
  colourway: nature,
  workflow_step: 2
	},{
  title: "",
  body: "New house smell",
  poet: anon,
  colourway: fire,
  workflow_step: 2
	},{
  title: "",
  body: "Free-flowing creativity",
  poet: anon,
  colourway: warning,
  workflow_step: 2
	},{
  title: "",
  body: "You know it.",
  poet: anon,
  colourway: ice,
  categories: [mythic],
  workflow_step: 2
	}]

test_poems.each do |poem|
  poem[:image] = open('http://lorempixel.com/1024/768/abstract')
  Poem.create( poem )
end