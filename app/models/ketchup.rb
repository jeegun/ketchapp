class Ketchup < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :notifications, dependent: :destroy
  validates :date, :start_time, :duration, :location, :status, presence: true
  geocoded_by :location
end
