# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy

  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :commented, through: :comments, source: 'post'

  has_many :likes, foreign_key: 'user_id', dependent: :destroy
  has_many :liked_posts, through: :likes, source: 'post'
  
  validates :name, presence: true, length: { maximum: 100 }
  scope :all_except, ->(user) { where.not(id: user) }
end
