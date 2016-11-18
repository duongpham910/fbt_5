class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :likes
  has_many :ratings
  has_many :reviews
  has_many :comments
  has_many :bookings
  has_many :bank_cards
end
