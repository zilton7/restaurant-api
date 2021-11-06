class User < ApplicationRecord
  has_secure_password

  has_many :all_restaurants, dependent: :destroy
  has_many :collections
  has_many :friends

  # validations
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password
end
