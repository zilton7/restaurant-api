require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:restaurants).dependent(:destroy) }

  it { should have_many :collections }
  it { should have_many :friends }
  
  # Validation tests
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
