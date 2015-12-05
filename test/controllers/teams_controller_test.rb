require File.expand_path("../../test_helper", __FILE__)

class TeamsControllerTest < ActionController::TestCase
  include Devise::TestHelpers  
   def setup
      sign_in users(:abdull)
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
    get :new
    assert_response :success
  end

  test "should create a team" do
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
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    patch :update, id: @team.id, team: { name: @team.name, division: @team.division }
    assert_equal flash[:notice], "Team has been succesfully updated!"
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_redirected_to teams_path
  end
  

end
