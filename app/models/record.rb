class Record < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, presence: true
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 3, message: "は1枚以上3枚以下にしてください" }
end
