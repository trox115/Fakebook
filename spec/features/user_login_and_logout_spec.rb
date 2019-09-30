# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'User Logs in and logs out' do
  scenario 'Test the log in and the log out' do
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
    expect(page).to have_content('Friends')
    expect(page).to have_content('Log Out')
    click_on 'Log Out'
    respond_to be_success
  end
end
