# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Logs in and' do
  describe 'send a friend request' do
    it 'checks success message' do
      @user = FactoryBot.create(:user)
      @other = FactoryBot.create(:user)
      login_as(@user, scope: :user)
      visit users_index_path
      first(:link, 'Send Friend Request').click
      expect(page).to have_content('You send a friend request to')
    end
    it 'checks friend request appears in Friends' do
      @user = FactoryBot.create(:user)
      @other = FactoryBot.create(:user)
      login_as(@user, scope: :user)
      visit users_index_path
      first(:link, 'Send Friend Request').click
      expect(page).to have_content("#{@other.name} #{@other.email}")
    end
  end
end
