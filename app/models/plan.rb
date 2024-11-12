class Plan < ApplicationRecord
  belongs_to :itinerary

  validates :icon_id, presence: true
  validates :content, presence: true
end
