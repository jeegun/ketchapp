class Notification < ApplicationRecord
  belongs_to :ketchup, optional: true
  belongs_to :trip, optional: true
  belongs_to :user
end
