require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    test "redirect to login" do
        visit sandbox_url
        
        assert_selector 'label', text: /email/i
        assert_selector 'label', text: /password/i

        user = create(:user)
        sign_in user

        visit sandbox_url

        assert_selector 'h1', text: /sandbox/i
    end
end
