# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#safe_user_name' do
    it "returns 'a deleted user' when the user is nil" do
      expect(helper.safe_user_name(nil)).to eq 'an anonymous user'
    end

    it "returns the user's name when the user is not nil" do
      user = instance_double(User, :user, name: 'Mia Knowles')
      expect(helper.safe_user_name(user)).to eq 'Mia Knowles'
    end
  end

  describe '#time_ago_tag' do
    it 'returns a time tag showing the relative time ago' do
      time = 4.days.ago
      expect(helper.time_ago_tag(time)).to eq "<time datetime=\"#{time.iso8601}\">4 days ago</time>"
    end
  end
end
