class Notification < ApplicationRecord
  belongs_to :ketchup
  belongs_to :trip
  belongs_to :user
end
