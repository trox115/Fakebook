# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence(:content) { |n| "Content of the post #{n}" }
    user
  end
end
