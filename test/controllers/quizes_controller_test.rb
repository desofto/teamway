require 'test_helper'

class QuizesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quizes_index_url
    assert_response :success
  end

  test "should get create" do
    get quizes_create_url
    assert_response :success
  end

end
