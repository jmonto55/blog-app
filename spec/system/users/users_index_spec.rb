require 'rails_helper'

RSpec.describe 'Users index page', type: :system do
  describe 'check the content of the index page' do
    before(:each) do
      @user_one = User.create(name: 'Jose', photo: 'pic.jpg', bio: 'software engineer', posts_counter: 0)
      @user_two = User.create(name: 'Salo', photo: 'pic.jpg', bio: 'software engineer', posts_counter: 0)
    end

    it 'should show the index page' do
      visit root_path
      expect(page).to have_content('Welcome to Blog 📮')
    end

    it 'profile picture for each user.' do
      visit root_path
      expect(page).to have_selector('img')
    end

    it 'the number of posts each user has written' do
      visit root_path
      expect(page).to have_content('Number of posts:')
    end

    it 'When I click on a user, I am redirected to that user show page' do
      visit root_path
      click_link 'Jose'
      expect(page).to have_content('software engineer')
    end
    it 'I can see the username of all users' do
      visit root_path
      expect(page).to have_content('Jose')
      expect(page).to have_content('Salo')
    end
  end
end
