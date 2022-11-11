# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :body, presence: true
end
