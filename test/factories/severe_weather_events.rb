FactoryBot.define do
  factory :severe_weather_event do
    start_date { Date.today }
    end_date { Date.tomorrow }

    trait :past do
      start_date { 7.days.ago }
      end_date { 4.days.ago }
    end

    trait :present do
      start_date { 1.days.ago }
      end_date { 1.day.from_now }
    end

    trait :future do
      start_date { 3.days.from_now }
      end_date { 6.days.from_now  }
    end
  end
end
