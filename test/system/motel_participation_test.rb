require "application_system_test_case"

class MotelParticipationTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  
  setup do
    user = create(:user)
    sign_in user
    create(:severe_weather_event, start_date: Date.tomorrow, end_date: Date.tomorrow + 1.day)
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
