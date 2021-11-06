class Friend < ApplicationRecord
  belongs_to :user

  # validations
  validates_presence_of :name
  validates_presence_of :email
end
