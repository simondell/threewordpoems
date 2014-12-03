# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# seed Colourways
# although these are production-level so should be in a Rake task.
Colourway.destroy_all

Colourway.create([{
	name: "Fire"
	},{
	name: "Warning"
	},{
	name: "Ice"
	},{
	name: "Nature"
	}])




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

Poem.create([{
  title: "",
  body: "Left foot forward",
  poet_id: Poet.where(first_name: "Anon")[0].id,
  colourway_id: Colourway.where(name: "Fire")[0].id
	},{
  title: "On the importance of wednesday dreams",
  body: "Imagination's purple reign",
  poet_id: Poet.where(first_name: "Simon")[0].id,
  colourway_id: Colourway.where(name: "Nature")[0].id
	}])