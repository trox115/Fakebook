# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    post
    sequence(:content) { |n| "Content of the Comment #{n}" }
  end
end
