require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.new(name: 'Tom', posts_counter: 0) }
  let(:post) { Post.create(author: user, title: 'Hello', likescounter: 0, commentscounter: 0) }

  it 'update_comment_counter method should increment user comments counter by one' do
    Comment.create(author: user, text: 'Hello everyone', post: post)
    expect(post.commentscounter).to equal(0)
  end
end
