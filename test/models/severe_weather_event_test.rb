require 'test_helper'

class SevereWeatherEventTest < ActiveSupport::TestCase
  test "has count of rooms through availabilities" do
    swe = create(:severe_weather_event)
    assert_equal swe.rooms, 0

    motel = create(:motel)
    Availability.create(severe_weather_event: swe, motel: motel, rooms: 10)
    assert_equal swe.rooms, 10

    motel = create(:motel)
    avail = Availability.create(severe_weather_event: swe, motel: motel, rooms: 20)
    assert_equal swe.rooms, 30
  end

  test "::current returns ongoing event" do
    refute SevereWeatherEvent.current

    # ending today
    swe = create(:severe_weather_event, start_date: Date.yesterday, end_date: Date.today)
    assert_equal SevereWeatherEvent.current, swe
    swe.destroy!

    # straddling today
    swe = create(:severe_weather_event, :present)
    assert_equal SevereWeatherEvent.current, swe
    swe.destroy!

    # starting today
    swe = create(:severe_weather_event, start_date: Date.today, end_date: Date.tomorrow)
    assert_equal SevereWeatherEvent.current, swe
  end

  test "::current returns future event if none ongoing" do
    refute SevereWeatherEvent.current

    swe = create(:severe_weather_event, :past)
    refute SevereWeatherEvent.current

    swe = create(:severe_weather_event, :future)
    assert_equal SevereWeatherEvent.current, swe
  end
   
  test "::current returns ongoing event when there's also a future event planned" do
    present = create(:severe_weather_event, :present) # ends 1 day from now
    assert_equal SevereWeatherEvent.current, present

    future = create(:severe_weather_event, :future) # starts 3 days from now
    assert_equal SevereWeatherEvent.current, :present
  end

  test "overlapping events" do
    swe = create(:severe_weather_event)
    assert swe.persisted?

    swe = build_stubbed(:severe_weather_event)
    refute swe.valid?
  end

  test "start/end dates make sense" do
    swe = build_stubbed(:severe_weather_event, start_date: Date.today, end_date: Date.yesterday)
    refute swe.valid?, "end_date: #{swe.end_date}  must be later than start_date: #{swe.start_date}"

    swe.end_date = Date.tomorrow
    assert swe.valid?
  end

  test "single-day events are valid" do
    swe = build_stubbed(:severe_weather_event, start_date: Date.today, end_date: Date.today)
    assert swe.valid?
  end

  test "distinct SWE must have at least one day between them (overlapping)" do
    swe = SevereWeatherEvent.create(start_date: Date.today, end_date: Date.tomorrow)
    assert swe.persisted?

    swe = build_stubbed(:severe_weather_event, start_date: Date.tomorrow, end_date: Date.tomorrow + 1)
    refute swe.valid?

    swe.start_date = Date.tomorrow + 1
    assert swe.valid?
  end

  test "#duration" do
    swe = build_stubbed(:severe_weather_event, start_date: Date.today, end_date: Date.today)
    assert_equal swe.duration, 1, "expected 1, got: #{swe.duration}"
  end
end
