# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Create posts with valid information' do
    it 'Creates one post with valid information' do
      expect(FactoryBot.build(:post)).to be_valid
    end
  end
  context 'Could not create invalid posts' do
    it 'Could not create an empty post' do
      expect(FactoryBot.build(:post, content: nil)).not_to be_valid
    end
    it 'Could not create a post without a creator' do
      expect(FactoryBot.build(:post, user_id: nil)).not_to be_valid
    end
  end
end
