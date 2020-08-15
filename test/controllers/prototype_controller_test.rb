require 'test_helper'

class PrototypeControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get prototype_feed_url
    assert_response :success
  end

end
