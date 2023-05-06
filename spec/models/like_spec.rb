require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.new(name: 'Tom', posts_counter: 0) }
  let(:post) { Post.create(author: user, title: 'Hello', likescounter: 0, commentscounter: 0) }

  it 'update_like_counter method should increment user likes counter by one' do
    Like.create(author: user, post:)
    expect(post.likescounter).to equal(0)
  end
end
