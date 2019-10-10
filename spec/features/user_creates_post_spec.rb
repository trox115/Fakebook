# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'User Logged In' do
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
    click_on 'New Post'
    within('form') do
      fill_in 'Post Content', with: 'Capybara Post'
    end
    click_button 'Post'
    expect(page).to have_content('Capybara Post')
  end
end
