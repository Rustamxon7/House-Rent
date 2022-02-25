class Reservation < ApplicationRecord
  validates :start_time, presence: true

  belongs_to :user
  belongs_to :house
end
