require 'test_helper'

class AvailabilityTest < ActiveSupport::TestCase
  test "motel has single availability record per swap event" do
    motel = Motel.create(name: 'asdf', address: 'asdf', phone: 'sdasdf')
    swe = SevereWeatherEvent.create(start_date: Date.yesterday, end_date: Date.today)
    assert_equal 0, swe.rooms

    avail = Availability.create(severe_weather_event: swe, motel: motel, rooms: 1)
    assert_equal swe.rooms, 1

    avail = Availability.create(severe_weather_event: swe, motel: motel, rooms: 10)
    refute avail.persisted?
    assert_equal swe.rooms, 1
  end
end
