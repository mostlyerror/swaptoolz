require 'test_helper'

class MotelTest < ActiveSupport::TestCase
  setup do
    @motel = Motel.create!(name: 'asdf', address: 'asdf', phone: 'asdf')
    @swe = SevereWeatherEvent.create(start_date: Date.today, end_date: Date.tomorrow)
  end

  test "#participation_indicated?" do
    refute @motel.participation_indicated?(@swe)
    @motel.availabilities.create(severe_weather_event: @swe, rooms: 0)
    assert @motel.participation_indicated?(@swe)
    @motel.availabilities.destroy_all
    refute @motel.participation_indicated?(@swe)
  end

  test "#participating? returns true if room availability created" do
    refute @motel.participating?(@swe)

    @motel.availabilities.create(severe_weather_event: @swe, rooms: 0)
    refute @motel.participating?(@swe)

    @motel.availabilities.create(severe_weather_event: @swe, rooms: 10)
    refute @motel.participating?(@swe)

    @motel.availabilities.destroy_all
    @motel.availabilities.create(severe_weather_event: @swe, rooms: 10)
    assert @motel.participating?(@swe)
  end
end
