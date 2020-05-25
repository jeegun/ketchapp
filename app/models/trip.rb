class Trip < ApplicationRecord
  belongs_to :user
  has_many :ketchups, dependent: :destroy
  validates :start_date, :end_date, :location, presence: true

  def maxLat
    self.latitude + 0.5
  end

  def minLat
    self.latitude - 0.5
  end

  def maxLng
    self.longitude + 0.5
  end

  def minLng
    self.longitude - 0.5
  end
end
