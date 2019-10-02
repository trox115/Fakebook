# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Try to access without login' do
    it 'can not go to the index' do
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    it 'can not go to the show' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'Try to access logged in' do
    it 'can go to the index' do
      user = FactoryBot.create(:user)
      sign_in(user)
      get :index
      respond_to be_success
    end

    it 'can go to the show view of itself' do
      user = FactoryBot.create(:user)
      sign_in(user)
      get :show, params: { id: user.id }
      respond_to be_success
    end

    it 'can go to the show view of other user' do
      user = FactoryBot.create(:user)
      other = FactoryBot.create(:user)
      sign_in(user)
      get :show, params: { id: other.id }
      respond_to be_success
    end
  end
end
