#require File.expand_path("../../test_helper", __FILE__)
require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
#  include Devise::TestHelpers  
   def setup
      @user = users(:isinjured)
      @other_user = users(:kendra)
      @team = teams(:one)
   end

   #def teardown
   #  @team = nil
   #end

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
    log_in_as(@other_user)
    patch :update, id: @other_user.id
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    log_in_as(@other_user)
    patch :update, id: @other_user.id
    patch :update, id: @team
    #patch :update, id: @team, team: { name: @team.name, division: @team.division }
    #patch :update, id: @team.id, team: { name: @team.name, division: @team.division }
    assert_equal flash[:notice], "Team has been succesfully updated!"
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    #assert_difference('Team.count', -1) do
    log_in_as(@other_user)
    patch :update, id: @other_user.id
    assert_difference 'Team.count', -1 do
      delete :destroy, id: @team
    end
    assert_redirected_to teams_url
  end
  

end
