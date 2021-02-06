require "application_system_test_case"

class MotelParticipationTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  
  setup do
    motel = Motel.create!(
      name: 'asdf',
      address: 'asdf',
      phone: 'asdf'
    )

    user = User.create!(
        email: 'bpoon@codeforamerica.org',
        password: 'passw0rd',
        password_confirmation: 'passw0rd',
        motel: motel
    )
    sign_in user

    @swe = SevereWeatherEvent.create(
      start_date: Date.tomorrow,
      end_date: Date.tomorrow + 1.day,
    )
  end


   test "motel opts out of swap period participation" do
    visit root_url
    assert_text /activated/i
    assert_text /participate?/
   end

   test "motel opts in to swap period participation" do
    visit root_url
    assert_text /activated/i
    assert_text /participate?/
   end
end
