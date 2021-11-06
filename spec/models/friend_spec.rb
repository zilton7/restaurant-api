require 'rails_helper'

RSpec.describe Friend, type: :model do
  # Association test
  it { should belong_to(:user) }

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
