# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Creates a comment' do
    it 'with valid information' do
      expect(FactoryBot.build(:comment)).to be_valid
    end
  end

  context 'Should not create a comment' do
    it 'without a user' do
      expect(FactoryBot.build(:comment, user: nil)).not_to be_valid
    end

    it 'without a referenced post' do
      expect(FactoryBot.build(:comment, post: nil)).not_to be_valid
    end

    it 'without content' do
      expect(FactoryBot.build(:comment, content: nil)).not_to be_valid
    end
  end
end
