require 'rails_helper'

RSpec.describe 'Posts index page', type: :system do
  describe 'check the content of the index page' do
    before(:each) do
      @user = User.create(name: 'Jose', photo: 'pic.jpg', bio: 'software developer')
      @post = Post.create(author: @user, title: 'Tests', text: 'testing', likes_counter: 7, comments_counter: 5)
      @comment1 = Comment.create(text: 'My first comment', author: @user, post: @post)
      @comment2 = Comment.create(text: 'My second comment', author: @user, post: @post)
    end

    feature 'Post show' do
      background { visit user_posts_path(@user.id) }

      it 'I can see the user\'s profile picture.' do
        img_src = page.first('img')['src']
        expect(img_src).to have_content 'pic-374e2a3927f9388c669fa74572e0c3261b8a656597b600535b14bdd49399236a.jpg'
      end

      it 'I can see the number of posts the user has written' do
        expect(page).to have_content('Number of posts: 1')
      end

      it 'I can see some of the post\'s body' do
        expect(page).to have_content 'testing'
      end

      it 'I can see the first comments on a post.' do
        expect(page).to have_content 'My first comment'
      end

      it 'I can see the user\'s username.' do
        expect(page).to have_content 'Jose'
      end
      it 'I can see how many comments a post has.' do
        expect(page).to have_content 'Comments: 7'
      end
      it 'I can see how many likes a post has.' do
        expect(page).to have_content '❤️ 7'
      end
      it 'if comments counter is integer' do
        expect(@post).to be_valid
      end
      it 'When I click on a post, it redirects me to that post\'s show page.' do
        click_link 'testing'
        expect(page).to have_content("Post #{@post.id} by Jose")
      end
    end
  end
end
