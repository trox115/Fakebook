# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Creates a friendship' do
    it 'Creates a friendship with factory bot' do
      expect(FactoryBot.build(:friendship)).to be_valid
    end
  end

  context 'Can not create a friendship' do
    it 'Can not create a friendship without a user' do
      expect(FactoryBot.build(:friendship, user: nil)).not_to be_valid
    end

    it 'Can not create a friendship without a friend' do
      expect(FactoryBot.build(:friendship, friend: nil)).not_to be_valid
    end

    it 'Can not create a friendship without a confirm value' do
      expect(FactoryBot.build(:friendship, confirmed: nil)).not_to be_valid
    end

    it 'Can not create a friendship twice' do
      user = FactoryBot.create(:user)
      friend = FactoryBot.create(:user)
      expect(FactoryBot.create(:friendship, user: user, friend: friend)).to be_valid
      expect(FactoryBot.build(:friendship, user: user, friend: friend)).not_to be_valid
    end
  end

  context 'The friendship relationship is symmetrical' do
    it "carlos is antonios'friend and antonio is carlos's friend" do
      carlos = FactoryBot.create(:user)
      antonio = FactoryBot.create(:user)
      f = FactoryBot.create(:friendship, user: carlos, friend: antonio)
      expect(f).to be_valid
      f.confirm_friendship
      expect(antonio.friends.length).to eql(1)
      expect(carlos.friends.length).to eql(1)
    end
  end

  context 'pending friends' do
    it 'carlos sends a friend request, carlos is in pending friends of antonio' do
      carlos = FactoryBot.create(:user)
      antonio = FactoryBot.create(:user)
      FactoryBot.create(:friendship, user: carlos, friend: antonio)
      expect(antonio.pending_friends.include?(carlos)).to eql(false)
    end

    it "carlos sends a friend request, antonio is in carlos's friends requests" do
      carlos = FactoryBot.create(:user)
      antonio = FactoryBot.create(:user)
      FactoryBot.create(:friendship, user: carlos, friend: antonio)
      expect(antonio.friend_requests.include?(antonio)).to eql(false)
    end
  end

  context 'confirm friendship' do
    it 'antonio confirms friendship with carlos' do
      carlos = FactoryBot.create(:user)
      antonio = FactoryBot.create(:user)
      f = FactoryBot.create(:friendship, user: carlos, friend: antonio)
      f.confirm_friendship
      expect(carlos.friends.include?(antonio)).to eql(true)
      expect(antonio.friends.include?(carlos)).to eql(true)
    end

    it 'carlos confirms invalid friendship with antonio' do
      carlos = FactoryBot.create(:user)
      antonio = FactoryBot.create(:user)
      f = FactoryBot.create(:friendship, user: carlos, friend: antonio)
      f.confirm_friendship
      expect(carlos.friends.include?(antonio)).to eql(true)
      expect(carlos.pending_friends.include?(antonio)).to eql(false)
      expect(carlos.friend_requests.include?(antonio)).to eql(false)
    end

    it 'carlos confirms invalid friendship with antonio' do
      carlos = FactoryBot.create(:user)
      antonio = FactoryBot.create(:user)
      f = FactoryBot.create(:friendship, user: carlos, friend: carlos)
      f.confirm_friendship
      expect(carlos.friends.include?(antonio)).to eql(false)
    end
  end
end
