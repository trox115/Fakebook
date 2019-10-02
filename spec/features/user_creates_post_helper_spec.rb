# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'User Logged In using helper' do
  scenario 'User creates a post' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit root_url
    click_on 'New Post'
    within('form') do
      fill_in 'Post Content', with: 'Test'
    end
    click_button 'Post'
    expect(page).to have_content('Your post has been created')
  end
end
