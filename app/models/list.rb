class List < ApplicationRecord
  belongs_to :user

  validates :sightseeing, presence: true
end
