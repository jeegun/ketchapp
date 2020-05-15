class Ketchup < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  validates :location, presence: true
end
