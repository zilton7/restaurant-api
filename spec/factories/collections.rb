FactoryBot.define do
  factory :collection do
    vegetarian_favorites { "MyString" }
    meat_lovers { "MyString" }
    user { nil }
  end
end
