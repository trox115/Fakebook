# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :ordered, -> { order(created_at: :DESC) }
end
