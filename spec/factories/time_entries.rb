FactoryBot.define do
  factory :time_entry do
    start_time { "2025-01-05 15:35:44" }
    end_time { "2025-01-05 15:35:44" }
    description { "MyText" }
    task { nil }
    user { nil }
  end
end
