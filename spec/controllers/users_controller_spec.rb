# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Try to access without login' do
    it 'can not go to the index' do
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    it 'can not go to the show' do
      get :show
      expect(response).to redirect_to new_user_session_path
    end
  end
end
