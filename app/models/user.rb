class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, presence: true, length: { maximum: 100 }

  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :houses, through: :favorites
end
