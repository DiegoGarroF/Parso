require 'test_helper'

class ParsoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parso_index_url
    assert_response :success
  end

end
