require 'test_helper'

class SetcardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get setcard_show_url
    assert_response :success
  end

end
