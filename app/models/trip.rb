class Trip < ApplicationRecord
  belongs_to :user
  has_many :ketchups, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates :start_date, :end_date, :location, presence: true
  geocoded_by :location
end
