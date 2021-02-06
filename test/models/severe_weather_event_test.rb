require 'test_helper'

class SevereWeatherEventTest < ActiveSupport::TestCase
  test "#active scope returns current SWE if one exists" do
    refute SevereWeatherEvent.active
    swe = SevereWeatherEvent.create(start_date: Date.today + 30, end_date: Date.today + 31)
    refute SevereWeatherEvent.active

    swe = SevereWeatherEvent.create(start_date: Date.today, end_date: Date.today + 1)
    assert SevereWeatherEvent.active
    assert SevereWeatherEvent.active == we
  end

  test "there can be only one (saved for a given block of time)" do
    swe = SevereWeatherEvent.create(start_date: Date.today, end_date: Date.today + 1)
    assert swe.persisted?

    swe = SevereWeatherEvent.create(start_date: Date.today, end_date: Date.today + 1)
    refute swe.persisted?, 'Overlapping event should not be saved'
    refute swe.valid?
  end
end
