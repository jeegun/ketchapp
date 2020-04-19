class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trips, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :ketchups, through: :trips
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :first_name, :last_name, presence: true

  def full_name
    return "#{first_name} #{last_name}"
  end

  def self.find_for_google_oauth2(auth)
    data = auth.info
    user = User.where(email: auth.info.email).create do |user|
      user.email = auth.info.email
      user.password = '123456'
      user.access_token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.save
      return user
    end
  end
end
