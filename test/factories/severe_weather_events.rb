FactoryBot.define do
  factory :severe_weather_event do
    start_date { Date.today }
    end_date { Date.tomorrow }
  end
end

