# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    question
    body { 'Hit the Esc key to enter "Normal mode". Then type :q and press the Enter key.' }
    author factory: :user
  end
end
