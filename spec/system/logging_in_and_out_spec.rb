# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'logging in and out' do
  before do
    driven_by(:rack_test)

    create(
      :user,
      name: 'Jessica White',
      email: 'jess.white@example.com',
      password: 'jessicas-password'
    )
  end

  it 'allows a user to log in and out' do
    visit root_path

    click_link 'Log in'

    fill_in 'Email', with: 'jess.white@example.com'
    fill_in 'Password', with: 'jessicas-password'

    click_button 'Log in'

    expect(page).to have_text 'Signed in as Jessica White'

    click_button 'Log out'

    expect(page).to have_link 'Log in'
  end
end
