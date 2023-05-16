require 'rails_helper'
RSpec.describe 'Post', type: :feature do
  describe 'Post' do
    before(:each) do
      @user = User.create(name: 'Jose', photo: 'pic.jpg', bio: 'software developer')
      @post = Post.create(author: @user, title: 'Tests', text: 'testing', likes_counter: 7, comments_counter: 5)
      @comment1 = Comment.create(text: 'My first comment', author: @user, post: @post)
      @comment2 = Comment.create(text: 'My second comment', author: @user, post: @post)
    end

    feature 'Post show' do
      background { visit user_post_path(@user.id, @post.id) }
      it 'I can see the post\'s title.' do
        expect(page).to have_content 'testing'
      end

      it 'Can see who wrote the post' do
        expect(page).to have_content 'Jose'
      end

      it 'Can see how many comments it has' do
        expect(page).to have_content 'Comments: 7'
      end

      it 'Can see how many likes it has' do
        expect(page).to have_content '7'
      end

      it 'Can see the post body' do
        expect(page).to have_content 'testing'
      end

      it 'Can see the username of each commentor' do
        expect(page).to have_content 'Jose'
      end

      it 'Can see the comment each commentor left' do
        expect(page).to have_content 'My first comment'
        expect(page).to have_content 'My second comment'
      end
    end
  end
end
