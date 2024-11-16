class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :itineraries
  has_many :plans
  has_many :lists
  has_many :spots
  has_many :prepares
  
  validates :nickname, presence: true
end
