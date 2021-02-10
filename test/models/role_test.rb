require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "user has many motels using roles" do
    user = create(:user)
    motel = create(:motel)
    assert_equal 0, user.motels.size

    user.add_role :front_desk, motel
    assert_equal 1, user.reload.motels.size
  end
end
