# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Gossip.destroy_all
User.destroy_all
City.destroy_all
#Tag.destroy_all
Like.destroy_all

20.times do
  city = City.create(name: Faker::Address.city, zip_code: Faker::Number.within(range: 10000..75999))
end

20.times do
  city = City.all.sample
  user = User.create(first_name: Faker::Movies::HarryPotter.character, last_name: Faker::Movies::HarryPotter.house, description: Faker::Movies::HarryPotter.quote, email: Faker::Internet.safe_email, age: Faker::Number.between(from: 18, to: 40), city: city, password: Faker::Lorem.characters(number: 10, min_alpha: 4))
end

20.times do
  gossip = Gossip.create(title: Faker::Movies::HarryPotter.spell, content: Faker::TvShows::MichaelScott.quote, user: User.all.sample)
end

# 10.times do
#    tag = Tag.create(title: Faker::Beer.brand)
#  end


#  40.times do
#   # random tag dans random gossip
#   random_tag1 = Tag.all.sample
#   random_gossip1 = Gossip.all.sample
#   random_gossip1.tags << random_tag1
#   # random gossip dans random tag
#   random_tag2 = Tag.all.sample
#   random_gossip2 = Gossip.all.sample
#   random_tag2.gossips << random_gossip2
# end

15.times do
  pm = CreatePrivateMessage.create(content: Faker::Lorem.sentence(word_count: 15), sender: User.all.sample, recipient: User.all.sample)
end

Gossip.all.each do |gossip|
  random = rand(0..6)
  random.times do
  Comment.create(content: Faker::TvShows::MichaelScott.quote, user: User.all.sample, gossip: gossip)
  end
end

Gossip.all.each do |gossip|
  random = rand(0..10)
  random.times do
    Like.create(user: User.all.sample, gossip: gossip)
  end
end
