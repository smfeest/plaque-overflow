# frozen_string_literal: true

module ApplicationHelper
  def safe_user_name(user)
    user ? user.name : 'an anonymous user'
  end
end
