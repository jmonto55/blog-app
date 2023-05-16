require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Tom', posts_counter: 0) }
  subject { Post.create(author: user, title: 'Hello', text: 'I feel awesome', likes_counter: 0, comments_counter: 0) }

  before { subject.save }

  it 'title should be present, expected false' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be present, expected true' do
    expect(subject).to be_valid
  end

  it 'title should be less than 250 characters, expected false' do
    subject.title = 'It was a dark and stormy night, and the wind howled
    through the empty streets.Sarah huddled under her coat, wishing she had
    stayed home instead of venturing out into the storm. As she turned a corner,
    she saw a figure in the distance. At first she thought it was just a trick of
    the light, but as she got closer she realized it was a man. He was tall and thin,
    with a black cloak that billowed around him in the wind. Sarahs heart raced as she
    tried to hurry past him, but he stepped in front of her, blocking her way. She could
    see his eyes glinting in the darkness, and she knew she was in trouble.'
    expect(subject).to_not be_valid
  end

  it 'comments_counter has to be greater or equal to 0, expected false' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter has to be greater or equal to 0, expected true' do
    expect(subject).to be_valid
  end

  it 'comments_counter has to be greater or equal to 0, expected true' do
    subject.comments_counter = 1
    expect(subject).to be_valid
  end

  it 'likes_counter has to be greater or equal to 0, expected false' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter has to be greater or equal to 0, expected true' do
    expect(subject).to be_valid
  end

  it 'likes_counter has to be greater or equal to 0, expected true' do
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  let(:user_one) { User.create(name: 'Tom', posts_counter: 0) }
  let(:post_one) do
    Post.create(author: user_one, title: 'Hello', text: 'I feel awesome', likes_counter: 0, comments_counter: 0)
  end

  it 'last_five comments methods should return the last 5 comments related tothe post' do
    Comment.create(text: 'comment zero', post: post_one, author: user_one)
    Comment.create(text: 'comment one', post: post_one, author: user_one)
    Comment.create(text: 'comment two', post: post_one, author: user_one)
    Comment.create(text: 'comment three', post: post_one, author: user_one)
    Comment.create(text: 'comment four', post: post_one, author: user_one)
    Comment.create(text: 'comment five', post: post_one, author: user_one)
    expect(post_one.last_five_comments.length).to equal(5)
  end

  it 'update_post_counter methods should increment user posts_counter by one' do
    Post.create(author: user_one, title: 'Hello', likes_counter: 0, comments_counter: 0)
    expect(user_one.posts_counter).to equal(0)
  end
end
