# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :commenters, through: :comments, source: 'user'

  has_many :likes, foreign_key: 'post_id', dependent: :destroy
  has_many :liked_users, through: :likes, source: 'user'
  validates :content, presence: true
  scope :ordered, -> { order(created_at: :DESC) }
  accepts_nested_attributes_for :comments
  has_one_attached :picture
end
