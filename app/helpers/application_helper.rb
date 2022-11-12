# frozen_string_literal: true

module ApplicationHelper
  def safe_user_name(user)
    user ? user.name : 'an anonymous user'
  end

  def time_ago_tag(time)
    time_tag(time, "#{time_ago_in_words(time)} ago")
  end
end
