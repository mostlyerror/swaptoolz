class Motel < ApplicationRecord
    validates_presence_of :name, :address, :phone

    has_many :users
    has_many :availabilities
    # has_many :severe_weather_events, through: :availabilities

    def participating?(swe)
      rooms = Availability.where(motel: self, severe_weather_event: swe)
        .first
        &.rooms
      rooms.to_i > 0
    end
end
