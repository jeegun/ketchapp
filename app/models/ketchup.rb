class Ketchup < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  validates :location, presence: true

  def opposed_user(user)
    user == self.trip.user ? self.user : self.trip.user
  end
end
