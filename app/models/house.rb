class Room < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
