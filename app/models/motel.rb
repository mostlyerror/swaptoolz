class Motel < ApplicationRecord
    validates_presence_of :name, :address, :phone

    has_many :users
    has_many :availabilities
    # has_many :severe_weather_events, through: :availabilities

    def participation_indicated?(swe)
      Availability.exists?(motel: self, severe_weather_event: swe)
    end

    def participating?(swe)
      return false if swe.nil?
      Availability.find_by(motel: self, severe_weather_event: swe)&.rooms.to_i > 0
    end
end
