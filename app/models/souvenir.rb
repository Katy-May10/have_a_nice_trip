class Souvenir < ApplicationRecord
  belongs_to :user

  validates :who, presence: true
end
