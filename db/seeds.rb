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
post = user.posts.build(content: 'One post')
post.save()
post = user.posts.build(content: 'other ṕost')
post.save()
post = user.posts.build(content: 'Third one')
post.save()

user = User.find_by(name: "antonio")
post = user.posts.build(content: 'One post')
post.save()
post = user.posts.build(content: 'other ṕost')
post.save()
post = user.posts.build(content: 'Third one')
post.save()