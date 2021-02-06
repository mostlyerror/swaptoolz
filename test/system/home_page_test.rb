require "application_system_test_case"

class HomePageTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    user = User.create!(
        email: 'bpoon@codeforamerica.org',
        password: 'passw0rd',
        password_confirmation: 'passw0rd'
    )
    sign_in user
  end

  test "homepage displays current swap period" do
    visit root_url
    assert_text /inactive/i

    swe = SevereWeatherEvent.create(
      start_date: Date.today,
      end_date: Date.tomorrow,
    )

    visit root_url
    assert_text /activated/i
    assert_text Date.today.to_formatted_s(:long)
    assert_text Date.tomorrow.to_formatted_s(:long)
    assert_text "#{swe.duration} days"
  end

  test "homepage displays future swap period" do
    visit root_url
    assert_text /inactive/i

    start_date = 2.days.from_now.to_date
    end_date = 4.days.from_now.to_date
    swe = SevereWeatherEvent.create(start_date: start_date, end_date: end_date)

    visit root_url
    assert_text /activated/i
    assert_text start_date.to_formatted_s(:long)
    assert_text end_date.to_formatted_s(:long)
    assert_text "#{swe.duration} days"
  end

  test "homepage shows inactive if no current or future swap period" do
    visit root_url
    assert_text /inactive/i

    swe = SevereWeatherEvent.create(
      start_date: 3.days.ago,
      end_date: 2.days.ago
    )

    visit root_url
    assert_text /inactive/i
  end
end
