# frozen_string_literal: true

module ApplicationHelper
  def creator(id)
    u = User.find_by(id: id)
    u.name
  end
end
