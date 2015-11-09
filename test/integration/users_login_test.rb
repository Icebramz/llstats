require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:kendra)
  end
  

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
    

  test "testing layout changes" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "kendra@gmail.com", password: "foobar" }
    assert_select "a[href=?]", login_path, count: 0
    #assert_template 'sessions/destroy'
    assert_select "a[href=?]", logout_path, count: 1
  end


  test "login with valid information followed by logout" do
    get login_path
    post login_path, session: { email: @user.email, password: "password" }
    assert is_logged_in?
    assert_redirected_to @user #check if right redirect target
    follow_redirect! #actually visits target page
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0 #verify that there are zero login path links on the page
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    #assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end


end
