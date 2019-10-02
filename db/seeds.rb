# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

user = User.find_by(name: "carlos")
post = user.posts.create(content: 'One post')
(0..5).each do |n|
  post.comments.create(user_id: user.id, content: "content for post #{n}")
end

post = user.posts.create(content: 'other ṕost')
(0..5).each do |n|
  post.comments.create(user_id: user.id, content: "content for post #{n}")
end

post = user.posts.create(content: 'Third one')
(0..5).each do |n|
  post.comments.create(user_id: user.id, content: "content for post #{n}")
end


user = User.find_by(name: "antonio")
post = user.posts.create(content: 'One post')
(0..5).each do |n|
  post.comments.create(user_id: user.id, content: "content for post #{n}")
end

post = user.posts.create(content: 'other ṕost')
(0..5).each do |n|
  post.comments.create(user_id: user.id, content: "content for post #{n}")
end

post = user.posts.create(content: 'Third one')


