# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :body, presence: true

  scope :order_by_most_recently_posted, -> { order(created_at: :desc) }
end
