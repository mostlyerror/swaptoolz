require "application_system_test_case"

class SwapPeriodTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    user = create(:user)
    sign_in user
  end

  test "homepage displays current swap period" do
    visit root_url
    assert_text /inactive/i

    swe = create(:severe_weather_event, :past)
    visit root_url
    assert_text /inactive/i

    swe.destroy
    swe = create(:severe_weather_event, :present)
    visit root_url
    assert_text /activated/i

    swe.destroy
    swe = create(:severe_weather_event, :future)
    visit root_url
    assert_text /activated/i
  end
end
