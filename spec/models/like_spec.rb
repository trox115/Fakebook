# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
context 'Creates a like' do
  it 'with valid information' do
    expect(FactoryBot.build(:like)).to be_valid
  end

  it 'with valid user and post ids' do
    test_post = FactoryBot.build(:post)
    test_user= FactoryBot.build(:user)
    expect(FactoryBot.build(:like, test_post, test_user)).to be_valid
  end
end
context 'should not create a like' do
   it 'without a user' do
    expect(FactoryBot.build(:like, user: nil)).not_to be_valid
  end
it 'without a referenced post' do
    expect(FactoryBot.build(:like, post_id: nil)).not_to be_valid
  end

it 'without a referenced post but with valid user' do
    expect(FactoryBot.build(:like, post_id: nil, user_id:1)).not_to be_valid
  end

it 'without a valid user but with a valid post' do
    expect(FactoryBot.build(:like, post_id:1, user_id:nil)).not_to be_valid
  end
end

end
