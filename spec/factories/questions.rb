# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    title { 'How long is a string?' }
    body { 'I need to know how much space to leave for some unknown string in my database' }
    author factory: :user
  end
end
