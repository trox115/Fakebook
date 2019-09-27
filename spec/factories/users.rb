# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@mail.com" }
    password { '12345678' }
  end
end
