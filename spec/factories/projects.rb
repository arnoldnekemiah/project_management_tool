FactoryBot.define do
  factory :project do
    name { "MyString" }
    description { "MyText" }
    start_date { "2025-01-05 15:33:27" }
    end_date { "2025-01-05 15:33:27" }
    status { "MyString" }
    user { nil }
  end
end
