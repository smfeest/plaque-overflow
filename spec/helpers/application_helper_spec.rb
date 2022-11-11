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
end
