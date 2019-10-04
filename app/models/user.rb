# frozen_string_literal: true

class User < ApplicationRecord
  #    Include default devise modules. Others available are:
  #    :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy

  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :commented, through: :comments, source: 'post'

  has_many :likes, foreign_key: 'user_id', dependent: :destroy
  has_many :liked_posts, through: :likes, source: 'post'

  validates :name, presence: true, length: { maximum: 100 }
  scope :all_except, ->(user) { where.not(id: user) }

  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    if !friends_array.nil?
      friends_array + inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    else
      friends_array = inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }

    end
    friends_array.compact
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship1 = inverse_friendships.find { |friendship| friendship.user == user }
    friendship1.confirmed = true
    friendship1.save
    friendship2 = user.inverse_friendships.find { |friendship| friendship.user == self } ||
                  Friendship.create(user_id: friendship1.friend_id,
                                    friend_id: friendship1.user_id)
    friendship2.confirmed = true
    friendship2.save
  end

  def friend?(user)
    friends.include?(user)
  end
end
