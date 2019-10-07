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
  has_many :friends, through: :friendships
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friends_friended = self.friendships.select(:id, :friend_id)
                                    .where(user_id: self.id, confirmed: true)

   friended_friends = self.inverse_friendships.select(:id, :user_id)
                                    .where(friend_id: self.id, confirmed:true)
   (get_users_with(friends_friended) + get_users_with(friended_friends))
  end

  def pending_friends
    friends_pending = self.friendships.select(:id, :friend_id)
                                    .where(user_id: self.id, confirmed: false)
    get_users_with(friends_pending)
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

  def get_users_with(ids)
     ids.each_with_object([]) do |friend, arr|
       arr << User.find(value_from(friend))
     end
   end
   def value_from(model)
     model.has_attribute?("user_id") ? model.user_id : model.friend_id
   end

  def friend?(user)
    friends.include?(user)
  end
end
