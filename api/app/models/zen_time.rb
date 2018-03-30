class ZenTime < ApplicationRecord
  belongs_to :user

  validates :date, :time, presence: true
end
