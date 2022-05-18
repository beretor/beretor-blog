require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest


  test "create new user" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {username: "John Doe", email: "john@gmail.com", 
      password: "1234", admin: false}}
      assert_response :redirect
  end
  follow_redirect!
  assert_response :success
  assert_match "John Doe", response.body
end


test "create new user and test validation" do
  get "/signup"
    assert_response :success
    assert_no_difference 'User.count' do
      post users_path, params: { user: {username: "John Doe", email: "", 
      password: "1234", admin: false} }
  end
  assert_match "errors", response.body
  assert_select 'div.alert'
  assert_select 'h4.alert-heading'
end

end
