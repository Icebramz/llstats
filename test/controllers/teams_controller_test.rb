#require File.expand_path("../../test_helper", __FILE__)
require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
#  include Devise::TestHelpers  
   def setup
      @user = users(:isinjured)
      @other_user = users(:kendra)
      @team = teams(:one)
   end

   def teardown
     @team = nil
   end

  def test_should_get_index 
   get :index 
   assert_response :success 
   assert_not_nil assigns(:teams) 
  end 

  test "should get new" do
    log_in_as(@other_user)
    get :new
    assert_response :success
  end

  test "should create a team" do
    log_in_as(@other_user)
    assert_difference('Team.count') do
      post :create, team: { name: @team.name, division: @team.division }
    end
    assert_equal flash[:notice], "Team has succesfully been added!"
    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end

  test "should get edit" do
    #log_in_as(@other_user)
    get(:edit, {'id' => "1"}, {'user_id' => 980190962})
    #@team.save
    #get :edit, id: @team
    assert_response :found
  end

  test "should redirect edit for non-logged in user" do
    assert_not is_logged_in?
    get(:edit, {'id' => "1"})
    assert_redirected_to login_url
  end

  test "should redirect edit for incorrect user" do
    log_in_as(@other_user)
    if assert_not_equal @other_user.team_id, @team.id
      get(:edit, {'id' => "1"})
      assert_redirected_to teams_url
    end
  end

  test "should update team" do
    log_in_as(@user)
    assert is_logged_in?
    if @user.team_id == @team.id
        patch :update, id: @team, team: {name: @team.name, division: @team.division, user: @team.user}  
        #patch :update, user_id: 98190962, id: @team, team: {name: @team.name, division: @team.division, user: @team.user}  
        assert_equal flash[:notice], "Team has been succesfully updated!"
        assert_redirected_to team_path(assigns(:team))
    end
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Team.count' do
      delete :destroy, id: @team
    end
    assert_redirected_to login_url
  end

  test "should destroy team" do
    log_in_as(@other_user)
    before = Team.count
    assert is_logged_in?
    if @other_user.team_id == @team.id
      delete :destroy, id: @team
      after = Team.count
      assert_equal after, before-1
	  assert_equal flash[:notice], "Team has been succesfully removed!"
      assert_redirected_to teams_url
    end

  end
  

end
