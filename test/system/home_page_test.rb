require "application_system_test_case"

class HomePagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
  
    assert_selector "h1", text: "Home"
    assert_selector "#hello-react", text: "Hello React!"
  end
end
