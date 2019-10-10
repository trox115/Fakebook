# frozen_string_literal: true

class User < ApplicationRecord
  #    Include default devise modules. Others available are:
  #    :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  after_create :send_welcome, unless: :test?

  has_many :posts, dependent: :destroy

  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :commented, through: :comments, source: 'post'

  has_many :likes, foreign_key: 'user_id', dependent: :destroy
  has_many :liked_posts, through: :likes, source: 'post'

  validates :name, presence: true, length: { maximum: 100 }
  scope :all_except, ->(user) { where.not(id: user) }

  has_many :friends, through: :friendships
  has_many :friendships
  has_one_attached :image
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friends_friended = friendships.select(:id, :friend_id)
      .where(confirmed: true)
    get_users_with(friends_friended)
  end

  def pending_friends
    friends_pending = friendships.select(:id, :friend_id)
      .where(confirmed: false)
    get_users_with(friends_pending)
  end

  def friend_requests
    friends_requests = inverse_friendships.select(:id, :user_id)
      .where(confirmed: false)
    get_users_with(friends_requests)
  end

  def get_users_with(ids)
    ids.each_with_object([]) do |friend, arr|
      arr << User.find(value_from(friend))
    end
  end

  def value_from(model)
    model.has_attribute?('user_id') ? model.user_id : model.friend_id
  end

  def friend?(user)
    friends.include?(user)
  end

  # Facebook Omniauth
  def self.new_with_session(params, session)
    super.tap do |user|
      data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
      if data
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def feed
    feed_users = friends
    feed_users << self
    Post.where(user_id: feed_users)
  end

  def send_welcome
    UserMailer.welcome(self).deliver
  end

  def test?
    ENV['RAILS_ENV'] == 'test'
  end
end
