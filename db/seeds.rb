# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Poet.create!(
  name:  "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  editor: true,
  activated: true,
  activated_at: Time.zone.now
)

99.times do |i|
  Poet.create!(
    name: Faker::Name.name,
    email: "example-#{i+1}@railstutorial.org",
    password: 'password',
    password_confirmation: 'password',
    activated: true,
    activated_at: Time.zone.now
  )
end

poets = Poet.order( :created_at ).take 6
50.times do
  title = Faker::Hipster.sentence
  content = Faker::Hipster.words( 3 ).join ' '
  poets.each {|poet| poet.poems.create title: title, content: content }
end