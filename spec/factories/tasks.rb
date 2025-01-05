FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    status { "MyString" }
    priority { 1 }
    due_date { "2025-01-05 15:35:10" }
    project { nil }
    assignee { nil }
  end
end
