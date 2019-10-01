# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  validates_uniqueness_of :user, scope: :post
end
