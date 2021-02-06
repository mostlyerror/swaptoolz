require "application_system_test_case"

class HomePageTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  test "visiting the homepage" do
    user = User.create!(
        email: 'bpoon@codeforamerica.org',
        password: 'passw0rd',
        password_confirmation: 'passw0rd'
    )
    sign_in user

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
end
