require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    test "redirect to login" do
        visit sandbox_url
        
        assert_selector 'label', text: /email/i
        assert_selector 'label', text: /password/i

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

        visit sandbox_url

        assert_selector 'h1', text: /sandbox/i
    end
end
