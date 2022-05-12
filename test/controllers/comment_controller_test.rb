require 'test_helper'

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get comment_edit_url
    assert_response :success
  end

end
