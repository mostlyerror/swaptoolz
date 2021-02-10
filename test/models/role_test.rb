require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "motel user has many motels through roles" do
    user = create(:user)
    motel = create(:motel)
    refute user.is_motel?

    user.add_role :front_desk, motel
    assert user.is_motel?
  end

  test "user is_admin?" do
    user = create(:user)
    refute user.is_admin?

    user.add_role :admin
    assert user.is_admin?
  end
end
