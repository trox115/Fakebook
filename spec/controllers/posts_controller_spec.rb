# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'get new post' do
    it 'returns http success' do
      get :new
      expect(response).not_to have_http_status(:success)
    end
  end

  describe 'get index post' do
    it 'returns http success' do
      get :index
      expect(response).not_to have_http_status(:success)
    end
  end
end
