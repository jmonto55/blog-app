require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

  before { subject.save }

  it 'name should be present, false expected because name = nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present, true expected because name = "Tom"' do
    expect(subject).to be_valid
  end

  it 'returns false if posts_counter is not a positive integer' do
    subject.posts_counter = -1
    expect(subject.valid?).to be false
  end

  it 'returns false if posts_counter is not an integer' do
    subject.posts_counter = nil
    expect(subject.valid?).to be false
  end

  let(:user) { User.new(name: 'Tom', posts_counter: 0) }

  it 'last_three_post methods should return the last 3 posts related to the user' do
    Post.create(author: user, title: 'This is a post', text: 'I feel aswesome', likes_counter: 0, comments_counter: 0)
    Post.create(author: user, title: 'This is second post', text: 'I feel aswesome', likes_counter: 0, comments_counter: 0)
    Post.create(author: user, title: 'This is third post', text: 'I feel aswesome', likes_counter: 0, comments_counter: 0)
    Post.create(author: user, title: 'This is fourth post', text: 'I feel aswesome', likes_counter: 0, comments_counter: 0)
    expect(user.last_three_posts.length).to equal(3)
  end
end
