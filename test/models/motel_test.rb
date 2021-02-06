require 'test_helper'

class MotelTest < ActiveSupport::TestCase
  test "#participating? returns true if some room availability has been created" do
    motel = Motel.create!(name: 'asdf', address: 'asdf', phone: 'asdf')
    swe = SevereWeatherEvent.create!(start_date: Date.today, end_date: Date.tomorrow)
    refute motel.participating?(swe)

    motel.availabilities.create!(severe_weather_event: swe, rooms: 10)
    assert motel.participating?(swe)
  end
end
