require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  test "should get status" do
    get characters_status_url
    assert_response :success
  end
end
