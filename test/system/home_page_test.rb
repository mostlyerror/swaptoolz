require "application_system_test_case"

class HomePageTest < ApplicationSystemTestCase
  before do
    user = User.create!(
        email: 'bpoon@codeforamerica.org',
        password: 'passw0rd',
        password_confirmation: 'passw0rd'
    )
    sign_in user
  end

  test "visiting the homepage" do
    visit root_url
    assert_text "SWAP Status: Inactive"

    SevereWeatherEvent.create(
      start: Date.today,
      en: Date.tomorrow,
    )

    assert_text "SWAP Status: Inactive"
    assert_selector 'button', /create swap event/i
  end
end
