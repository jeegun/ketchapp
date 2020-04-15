class Ketchup < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  validates :date, :start_time, :duration, :message, :location, presence: true
  geocoded_by :location
end
