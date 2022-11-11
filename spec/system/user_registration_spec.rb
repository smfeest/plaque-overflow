# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user registration' do
  before do
    driven_by(:rack_test)
  end

  it 'allows a user to register for an account' do
    visit root_path

    click_link 'Register'

    fill_in 'Name', with: 'Kit Shelton'
    fill_in 'Email', with: 'kit.shelton@example.com'
    fill_in 'Password', with: 'kits-password'

    click_button 'Register'

    expect(page).to have_text 'Signed in as Kit Shelton'
  end
end
