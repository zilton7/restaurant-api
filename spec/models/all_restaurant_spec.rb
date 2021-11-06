require 'rails_helper'

RSpec.describe AllRestaurant, type: :model do
  # Association test
  it { should belong_to(:user) }
  it { should belong_to(:collection) }

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:opening_date) }
end
