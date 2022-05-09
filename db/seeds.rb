# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all

20.times do
  city = City.create(name: Faker::Address.city, zip_code: Faker::Number.within(range: 10000..75999))
end

10.times do
  city = City.all.sample
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.safe_email, age: Faker::Number.between(from: 18, to: 40), city: city)
end

20.times do
  gossip = Gossip.create(title: Faker::Lorem.sentence(word_count: 3), content: Faker::Lorem.sentence(word_count: 15), user: User.all.sample)
end

10.times do
   tag = Tag.create(title: Faker::Beer.brand)
 end


 40.times do
  # random tag dans random gossip
  random_tag1 = Tag.all.sample
  random_gossip1 = Gossip.all.sample
  random_gossip1.tags << random_tag1
  # random gossip dans random tag
  random_tag2 = Tag.all.sample
  random_gossip2 = Gossip.all.sample
  random_tag2.gossips << random_gossip2
end

15.times do
  pm = CreatePrivateMessage.create(content: Faker::Lorem.sentence(word_count: 15), sender: User.all.sample, recipient: User.all.sample)
end