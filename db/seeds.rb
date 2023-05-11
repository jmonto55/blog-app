# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Luis', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Colombia.')
fourth_user = User.create(name: 'Abel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Moroco.')

first_post_first = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post_first = Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
third_post_first = Post.create(author: first_user, title: 'Hello', text: 'This is my third post')

first_post_second = Post.create(author: second_user, title: 'Hello', text: 'This is my first post')
second_post_second = Post.create(author: second_user, title: 'Hello', text: 'This is my second post')
third_post_second = Post.create(author: second_user, title: 'Hello', text: 'This is my third post')

first_post_third = Post.create(author: third_user, title: 'Hello', text: 'This is my first post')
second_post_third = Post.create(author: third_user, title: 'Hello', text: 'This is my second post')
third_post_third = Post.create(author: third_user, title: 'Hello', text: 'This is my third post')

Comment.create(post: first_post_first, author: second_user, text: 'Hi Tom!')
Comment.create(post: first_post_first, author: third_user, text: 'Nice to see you, Tom!')
Comment.create(post: first_post_first, author: fourth_user, text: 'Looking good')