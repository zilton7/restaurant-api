class Collection < ApplicationRecord
  belongs_to :user
  has_many :all_restaurants, through: :user

  # validations
  validates_presence_of :vegetarian_favorites
  validates_presence_of :meat_lovers
end
