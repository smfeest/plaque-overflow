# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shared/_session_bar' do
  before do
    without_partial_double_verification do
      allow(view).to receive(:current_user).and_return(current_user)
    end
  end

  context 'when the user is logged in' do
    let(:current_user) { instance_double(User, :user, name: 'Morgan Cloyd') }

    it "displays the user's name" do
      render
      expect(rendered).to have_content 'Signed in as Morgan Cloyd'
    end

    it 'includes a log out button' do
      render
      expect(rendered).to have_button 'Log out'
    end
  end

  context 'when the user is not logged in' do
    let(:current_user) { nil }

    it 'includes a link to log in' do
      render
      expect(rendered).to have_link 'Log in'
    end

    it 'includes a link to register' do
      render
      expect(rendered).to have_link 'Register'
    end
  end
end
