class Spot < ApplicationRecord
  belongs_to :list
  belongs_to :user

  validates :suggestion, presence: true
end
