# frozen_string_literal: true

FactoryBot.define do
  sequence :user_email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    name { 'Alina Green' }
    email { FactoryBot.generate(:user_email) }
    password { 'not-very-secret-password' }
  end
end
