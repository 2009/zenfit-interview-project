class User < ApplicationRecord
  has_secure_password

  enum role: [:user, :manager, :admin]

  validates :email, uniqueness: true
  validates :email, :password_digest, :role, presence: true
  validates :password, :password_confirmation, presence: true, on: :create
end
