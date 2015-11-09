require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
     get signup_path
     assert_no_difference 'User.count' do
        post users_path, user: { name:  "",
                                 email: "user@invalid",
                                 password:              "foo",
                                 password_confirmation: "bar" }
     end
     assert_template 'users/new'
     #assert_select 'div#<CSS id for error explanation>'
     assert_select 'div#error_explanation'
     #assert_select 'div.<CSS class for field with error>'
     assert_select 'div.field_with_errors'
  end


 #note on below: verifies that the user show template renders following successful signup
 #for below test to work: need the Users routes, the Users show action, & show.html.erb view to work correctly
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show' #this is a sensitive test for almost everything related to a user's profile page
    assert is_logged_in?
  end


end
