class User < ApplicationRecord
  has_secure_password

  enum role: [:user, :manager, :admin]

  has_many :zen_times, dependent: :destroy

  validates :email, uniqueness: true
  validates :email, :password_digest, :role, presence: true
  validates :password, :password_confirmation, presence: true, on: :create
end
