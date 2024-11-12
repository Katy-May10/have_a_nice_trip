class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :palns

  validates :location, presence: true
end
