# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email_id, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 8..16 }
  validates :username, presence: true, uniqueness: true, length: { in: 5..10 }
end
