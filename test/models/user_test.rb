require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(userable: GeneralUser.new)
    assert_not user.save, 'Saved the user without a email'
  end
end
