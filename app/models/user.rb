# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, presence: true, length: { maximum: 250 }

  has_secure_password

  def self.ci_find_by_email(email)
    find_by(email: email&.downcase)
  end

  def email=(value)
    write_attribute(:email, value&.downcase)
  end
end
