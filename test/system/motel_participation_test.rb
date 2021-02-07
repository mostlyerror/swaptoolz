require "application_system_test_case"

class MotelParticipationTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  
  setup do
    user = create(:user)
    sign_in user
  end

  test "participation form shows if future swap period" do
    skip('not implemented')
    visit root_url
    refute_text /participate?/i

    create(:severe_weather_event, :future)
    assert_text /participate?/i
  end

  test "motel opts out of swap period participation" do
    skip('not implemented')
  end

  test "motel opts in to swap period participation" do
    skip('not implemented')
  end
end
