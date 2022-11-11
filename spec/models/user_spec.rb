# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '.ci_find_by_email' do
    it 'returns nil when email is nil' do
      expect(described_class.ci_find_by_email(nil)).to be_nil
    end

    it 'ignores case differences when finding the user' do
      create(:user, email: 'antoine@beaulieu.fr')
      caroline = create(:user, email: 'caroline.blanchar@example.com')

      expect(described_class.ci_find_by_email('Caroline.Blanchar@EXAMPLE.com')).to eq(caroline)
    end

    it 'returns nil when no matching user is found' do
      expect(described_class.ci_find_by_email('user@example.com')).to be_nil
    end
  end

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
