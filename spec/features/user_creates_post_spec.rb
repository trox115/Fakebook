# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'User creates a post' do
  scenario 'user logs in and creates a post' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
    expect(page).to have_link 'Home'
    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_content('Home')
    expect(page).to have_content('Feed')
    expect(page).to have_content('New Post')
    expect(page).to have_content('Log Out')
    click_on 'New Post'
    within('form') do
      fill_in 'Post Content', with: 'Capybara Post'
    end
    click_button 'Post'
    expect(page).to have_content('Capybara Post')
    click_on 'Log Out'
    expect(page).to have_content('Signed out successfully')
  end

  scenario 'an empty post could not be created' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
    click_on 'New Post'
    within('form') do
      fill_in 'Post Content', with: ''
    end
    click_button 'Post'
    expect(page).to have_content("Content can't be blank")
  end
end
