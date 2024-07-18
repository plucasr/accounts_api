require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Assuming you have fixtures or factories set up
    @user_service = Minitest::Mock.new # Mock the UserService
    Container.stub(:resolve, @user_service) do # Stub the Container.resolve method
      @user_service.expect(:list_users, [ @user ], [ { filter: nil, sort: nil, page: nil, per_page: nil } ]) # Expect list_users to be called
    end
  end

  teardown do
    Container.unstub(:resolve)
    @user_service.verify
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
    assert_equal [ @user ].to_json, response.body # Verify the response body
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: "new_user@example.com", first_name: "New", last_name: "User", password: "password123" } }, as: :json
    end

    assert_response :created
    assert_equal "application/json; charset=utf-8", response.content_type
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
    assert_equal @user.to_json, response.body # Verify the response body
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: "updated@example.com", first_name: "Updated", last_name: "User", password: "newpassword" } }, as: :json
    assert_response :success
    assert_equal @user.reload.to_json, response.body # Verify the updated user
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end

  test "should handle invalid user creation" do
    post users_url, params: { user: { email: nil } }, as: :json
    assert_response :unprocessable_entity
    assert_equal "application/json; charset=utf-8", response.content_type
    assert_includes response.body, "Email can't be blank"
  end

  test "should handle invalid user update" do
    patch user_url(@user), params: { user: { email: nil } }, as: :json
    assert_response :unprocessable_entity
    assert_equal "application/json; charset=utf-8", response.content_type
    assert_includes response.body, "Email can't be blank"
  end
end
