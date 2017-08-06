require 'test_helper'

class MomentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moment_index_url
    assert_response :success
  end

  test "should get delete" do
    get moment_delete_url
    assert_response :success
  end

end
