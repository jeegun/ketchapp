class Ketchup < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :notifications, dependent: :destroy
  validates :location, presence: true
  # geocoded_by :location
end
