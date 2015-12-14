#require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:kendra)
    @other_user = users(:isinjured)
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should get index when logged in" do
    log_in_as(@user)
    get :index
    assert_response :success
    assert_select "h1", "All Coaches"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "h4", "Sign up"
  end

  test "should get show of logged in user" do
    get :show, id: @user
    assert_response :success
    assert "title", @user.name
  end
 
  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end
 
  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch :update, id: @other_user, user: { password: "password", password_confirmation: "password", admin: @user }
    assert_not @other_user.reload.admin? #must reload the instance variable after making changes to the underlying record
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

  #2 tests below verify the behavior in the case of an unauthorized (non-admin) user
  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end



end
