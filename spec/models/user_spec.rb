# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '#email=' do
    subject(:user) { described_class.new(email: 'old-email@example.com') }

    it 'converts the new value to lowercase' do
      user.email = 'New-Email@EXAMPLE.com'
      expect(user.email).to eq('new-email@example.com')
    end

    it 'does not attempt to transform nil values' do
      user.email = nil
      expect(user.email).to be_nil
    end
  end
end
