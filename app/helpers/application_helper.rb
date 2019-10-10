# frozen_string_literal: true

module ApplicationHelper
  def creator(id)
    u = User.find_by(id: id)
    u.name
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
