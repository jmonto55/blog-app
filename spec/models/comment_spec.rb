require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.new(name: 'Tom', posts_counter: 0) }
  let(:post) { Post.create(author: user, title: 'Hello', text: 'I feel awesome', likes_counter: 0, comments_counter: 0) }

  it 'update_comment_counter method should increment user comments counter by one' do
    Comment.create(author: user, text: 'Hello everyone', post: post)
    expect(post.comments_counter).to equal(1)
  end
end
