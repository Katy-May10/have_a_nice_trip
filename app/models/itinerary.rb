class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :plans

  validates :location, presence: true
end
