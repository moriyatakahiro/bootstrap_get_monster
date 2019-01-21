require 'test_helper'

class ProrertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prorerties_index_url
    assert_response :success
  end

end
