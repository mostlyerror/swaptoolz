require 'test_helper'

class SevereWeatherEventTest < ActiveSupport::TestCase
  test "has count of rooms through availabilities" do
    swe = SevereWeatherEvent.create(start_date: Date.yesterday, end_date: Date.today)
    assert_equal swe.rooms, 0

    motel = Motel.create(name: 'asdf', address: 'asdf', phone: 'asdf')
    Availability.create(severe_weather_event: swe, motel: motel, rooms: 10)
    assert_equal swe.rooms, 10

    motel = Motel.create(name: 'asdf', address: 'asdf', phone: 'asdf')
    avail = Availability.create(severe_weather_event: swe, motel: motel, rooms: 20)
    assert_equal swe.rooms, 30
  end

  test "::current returns ongoing event" do
    refute SevereWeatherEvent.current

    swe = SevereWeatherEvent.create(start_date: Date.yesterday, end_date: Date.today)
    assert_equal SevereWeatherEvent.current, swe
    swe.destroy!

    swe = SevereWeatherEvent.create(start_date: Date.yesterday, end_date: Date.tomorrow)
    assert_equal SevereWeatherEvent.current, swe
    swe.destroy!

    swe = SevereWeatherEvent.create(start_date: Date.today, end_date: Date.tomorrow)
    assert_equal SevereWeatherEvent.current, swe
  end

  test "::current returns future event if none ongoing" do
    refute SevereWeatherEvent.current
    swe = SevereWeatherEvent.create(start_date: 3.days.ago, end_date: 2.days.ago)
    refute SevereWeatherEvent.current

    swe = SevereWeatherEvent.create(start_date: Date.tomorrow, end_date: 3.days.from_now)
    assert_equal SevereWeatherEvent.current, swe
  end

  test "overlapping events" do
    swe = SevereWeatherEvent.create(start_date: Date.today, end_date: Date.today + 1)
    assert swe.persisted?

    swe = SevereWeatherEvent.create(start_date: Date.today, end_date: Date.today + 1)
    refute swe.persisted?, 'Overlapping event should not be saved'
    refute swe.valid?
  end

  test "start/end dates make sense" do
    swe = SevereWeatherEvent.new(start_date: Date.today, end_date: Date.yesterday)
    refute swe.valid?, "end_date: #{swe.end_date}  must be later than start_date: #{swe.start_date}"

    swe.end_date = Date.tomorrow
    assert swe.valid?
  end

  test "single-day events are valid" do
    swe = SevereWeatherEvent.new(start_date: Date.today, end_date: Date.today)
    assert swe.valid?
  end

  test "distinct SWE must have at least one day between them (overlapping)" do
    swe = SevereWeatherEvent.create(start_date: Date.today, end_date: Date.tomorrow)
    assert swe.persisted?

    swe = SevereWeatherEvent.new(start_date: Date.tomorrow, end_date: Date.tomorrow + 1)
    refute swe.valid?

    swe.start_date = Date.tomorrow + 1
    assert swe.valid?
  end

  test "#duration" do
    swe = SevereWeatherEvent.new(start_date: Date.today, end_date: Date.today)
    assert_equal swe.duration, 1, "expected 1, got: #{swe.duration}"
  end
end
