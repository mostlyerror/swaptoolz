require "application_system_test_case"

class HomepageBasedOnRoleTest < ApplicationSystemTestCase
  test "motel logs in and sees motel homepage" do
    motel = create(:motel)
    password = 'passw0rd'
    motel_user = create(:user, password: password, password_confirmation: password)
    motel_user.add_role :front_desk, motel

    visit root_path
    fill_in "Email", with: motel_user.email
    fill_in "Password", with: password
    click_on "Log in"

    assert_text /motel/i
  end

  test "admin logs in and sees swap homepage" do
    password = 'passw0rd'
    admin_user = create(:user, password: password, password_confirmation: password)
    admin_user.add_role :admin

    visit root_path
    fill_in "Email", with: admin_user.email
    fill_in "Password", with: password
    click_on "Log in"

    assert_text /admin/i
  end
end
