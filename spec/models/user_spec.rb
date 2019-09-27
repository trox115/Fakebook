# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Create a user with valid information' do
    it 'Creates the user' do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
end
