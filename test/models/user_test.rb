require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should follow and unfollow a user" do
    pat = users(:one)
    steve  = users(:admin)
    assert_not pat.following?(steve)
    pat.follow(steve)
    assert pat.following?(steve)
    assert steve.followers.include?(pat)
    pat.unfollow(steve)
    assert_not pat.following?(steve)
  end
end
