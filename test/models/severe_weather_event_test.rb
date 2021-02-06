require 'test_helper'

class SevereWeatherEventTest < ActiveSupport::TestCase
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
