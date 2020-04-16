class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trips, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :ketchups, through: :trips
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def full_name
    return "#{first_name} #{last_name}"
  end
end
