require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.new(name: 'Tom', posts_counter: 0) }
  let(:post) { Post.create(author: user, title: 'Hello', text: 'I feel awesome', likes_counter: 0, comments_counter: 0) }

  it 'update_like_counter method should increment user likes counter by one' do
    Like.create(author: user, post: post)
    expect(post.likes_counter).to equal(1)
  end
end
