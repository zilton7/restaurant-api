class AllRestaurant < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  # validations
  validates_presence_of :name
  validates_presence_of :opening_date 
end
