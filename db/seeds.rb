# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hanako = User.create!(email: 'hanako@example.com', password: 'password')
irie = User.create!(email: 'irie@exmaple.com', password: 'password')

3.times do
 hanako.articles.create!(
  title: Faker::Lorem.sentence(word_count: 5),
  content: Faker::Lorem.sentence(word_count: 100)
 )
end

4.times do
  irie.articles.create!(
   title: Faker::Lorem.sentence(word_count: 5),
   content: Faker::Lorem.sentence(word_count: 100)
  )
 end

