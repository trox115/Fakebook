# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'get new post' do
    it 'returns http success' do
      user = FactoryBot.create(:user)
      sign_in(user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'get index post' do
    it 'returns http success' do
      user = FactoryBot.create(:user)
      sign_in(user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
