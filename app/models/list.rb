class List < ApplicationRecord
  belongs_to :user
  has_many :spots

  validates :sightseeing, presence: true
end
