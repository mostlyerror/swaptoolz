class Availability < ApplicationRecord
  belongs_to :motel
  belongs_to :severe_weather_event
  validates :motel, uniqueness: { scope: :severe_weather_event }
end
