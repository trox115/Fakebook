# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Creates a like' do
    it 'with valid information' do
      expect(FactoryBot.build(:like)).to be_valid
    end

    it 'with valid user and post ids' do
      test_post = FactoryBot.create(:post)
      test_user = FactoryBot.create(:user)
      expect(FactoryBot.build(:like, post_id: test_post.id, user_id: test_user.id)).to be_valid
    end
  end
  context 'should not create a like' do
    it 'without a user' do
      expect(FactoryBot.build(:like, user_id: nil)).not_to be_valid
    end

    it 'if the user does not exist' do
      # build creates a user in memory but not in the db
      test_user = FactoryBot.build(:user)
      expect(FactoryBot.build(:like, user_id: test_user.id)).not_to be_valid
    end

    it 'without a referenced post' do
      expect(FactoryBot.build(:like, post_id: nil)).not_to be_valid
    end

    it 'in a post tha does not exists' do
      test_post = FactoryBot.build(:post)
      expect(FactoryBot.build(:like, post_id: test_post.id)).not_to be_valid
    end

    it 'without a referenced post but with valid user' do
      test_user = FactoryBot.build(:user)
      expect(FactoryBot.build(:like, post_id: nil, user_id: test_user.id)).not_to be_valid
    end

    it 'without a valid user but with a valid post' do
      test_post = FactoryBot.build(:post)
      expect(FactoryBot.build(:like, post_id: test_post.id, user_id: nil)).not_to be_valid
    end
  end

  context 'Like should be created just once by user' do
    it 'like just once' do
      test_post = FactoryBot.create(:post)
      test_user = FactoryBot.create(:user)
      expect(FactoryBot.create(:like, post_id: test_post.id, user_id: test_user.id)).to be_valid
      expect(FactoryBot.build(:like, post_id: test_post.id, user_id: test_user.id)).not_to be_valid
    end
  end
end
