class Record < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, presence: true
  validates :images, presence: true
end
