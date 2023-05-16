require 'rails_helper'

RSpec.describe 'Test for the user show page', type: :system do
  before(:each) do
    @new_user = User.create(name: 'Salo', photo: 'pic.jpg', bio: 'software engineer', posts_counter: 0)
    @post_one = Post.create(author: @new_user, title: 'Hello', text: 'this is my first post', comments_counter: 0,
                            likes_counter: 0)
    @post_two = Post.create(author: @new_user, title: 'Hallo', text: 'why are you here?', comments_counter: 0,
                            likes_counter: 0)
    @post_three = Post.create(author: @new_user, title: 'Chao', text: 'Hello Rails', comments_counter: 0,
                              likes_counter: 0)
    @post_four = Post.create(author: @new_user, title: 'Salute', text: 'I feel awesome', comments_counter: 0,
                             likes_counter: 0)
    @post_five = Post.create(author: @new_user, title: 'Hi', text: 'this is true', comments_counter: 0,
                             likes_counter: 0)
  end
  it 'User should see the other user\'s profile picture' do
    visit user_path(@new_user)
    expect(page).to have_selector('img')
  end
  it 'User should see the user\'s username' do
    visit user_path(@new_user)
    expect(page).to have_content('Salo')
  end
  it 'User should see the number of posts the user has written' do
    visit user_path(@new_user)
    expect(page).to have_content('Salo')
  end
  it 'User should see the see the user\'s bio' do
    visit user_path(@new_user)
    expect(page).to have_content('software engineer')
  end
  it 'should see the user\'s first 3 posts only' do
    visit user_path(@new_user)
    expect(page).to have_content('this is my first post')
    expect(page).to have_content('why are you here?')
    expect(page).to have_content('Hello Rails')
    expect(page).not_to have_content('this is true')
  end
  it 'User should see the see  a button that lets me view all of a user\'s posts' do
    visit user_path(@new_user)
    expect(page).to have_content('See all posts')
  end
  it 'User click see all posts, it redirects me to the user\'s post\'s index page' do
    visit user_path(@new_user)
    click_link 'See all posts'
    expect(page).to have_content('this is true')
  end
end
