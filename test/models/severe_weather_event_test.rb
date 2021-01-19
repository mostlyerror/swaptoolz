require 'test_helper'

class SevereWeatherEventTest < ActiveSupport::TestCase
  test "#active scope returns current SWE if there one exists" do
    refute SevereWeatherEvent.active
    swe = SevereWeatherEvent.create(start: Date.today + 30, end: Date.today + 31)
    refute SevereWeatherEvent.active

    swe = SevereWeatherEvent.create(start: Date.today, end: Date.today + 1)
    assert SevereWeatherEvent.active
    assert SevereWeatherEvent.active == we
  end

  test "there can be only one (at any given time)" do
    swe = SevereWeatherEvent.create(start: Date.today, end: Date.today + 1)
    assert swe.persisted?

    swe = SevereWeatherEvent.create(start: Date.today, end: Date.today + 1)
    refute swe.persisted?, 'Overlapping event should not be saved'
    assert swe.valid?
  end
end
