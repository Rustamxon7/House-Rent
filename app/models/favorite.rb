class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :house, optional: true
  validates :user, presence: true
  validates :house, presence: true
end
