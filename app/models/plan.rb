class Plan < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  enum icon_id: {
    plane: 0,
    train: 1,
    car: 2,
    walk: 3,
    restaurant: 4,
    cafe: 5,
    sightseeing: 6,
    shopping: 7,
    hotel: 8,
    hotspring: 9,
    rest: 10,
  }

  validates :content, presence: true
end
