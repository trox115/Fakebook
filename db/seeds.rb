# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!( name: 'carlos',
              email: 'carlos@email.com',
              password: 'foobar',
              password_confirmation: 'foobar')

User.create!( name: 'antonio',
              email: 'antonio@email.com',
              password: 'foobar',
              password_confirmation: 'foobar')

User.create!( name: 'angie',
              email: 'angie@email.com',
              password: 'foobar',
              password_confirmation: 'foobar')

20.times do   
  User.create!( name: Faker::Name.name,
                email: Faker::Internet.email,
                password: 'foobar',
                password_confirmation: 'foobar')
end

users = User.all
users.each do |user|
  # each user creates posts
  (0..5).each do |n|
    post = user.posts.create(content: Faker::Lorem.sentence )
  end
  others = User.all_except(user).order("RANDOM()").limit(10)
  counter = 0
  others.each do |other|
    f = Friendship.create(user_id: other.id, friend_id: user.id, confirmed: false)
    user.confirm_friend(other) if counter.odd? && f.valid?
    counter += 1
  end
end

posts = Post.all
posts.each do |post|
  users = User.order("RANDOM()").limit(3)
  users.each do |user|
    post.comments.create(user_id: user.id, content: Faker::Lorem.sentence )
  end
end



