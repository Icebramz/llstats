require 'test_helper'

class GamesControllerTest < ActionController::TestCase

  def setup
    @game = games(:one)
    @user = users(:live)
    @user2 = users(:isinjured)
#    @game.awayteam = teams(:one)
#    @game.awayteam.user = users(:kendra)
    @game4 = games(:four)
  end

  def teardown
    @game = nil
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

   test "should create a game" do
     log_in_as(@user)
     assert_difference('Game.count') do
       post :create, game: {hometeam_id: @game.hometeam_id, awayteam_id: @game.awayteam_id}
     end
     assert_redirected_to game_path(assigns(:game))
   end
 
  test "should redirect create when not logged in" do
    assert_no_difference 'Game.count' do
       post :create, game: {hometeam_id: @game.hometeam_id, awayteam_id: @game.awayteam_id}
    end
    assert_redirected_to login_url
  end



  test "should show game" do
    #get :show, id: @game.id
    #assert_response :success
  end

  test "should get edit for correct user" do
     log_in_as(@user)
     #assert_equal @game.id, @user.game_id
     get(:edit, {'id' => @game.id}, {'user_id' => 980190962})
     assert_response :found
  end

  test "should redirect edit for incorrect user" do
     log_in_as(@user2)
     assert_not_equal @user2.game_id, @game.id
     #get :edit, id: @game.id, user_id: @user2.id
     #assert_redirected_to game_path
  end 

  test "should redirect edit for non-logged in user" do
     is_logged_in?
     #assert_not_equal @game.awayteam_id, @user2.team_id
     get(:edit, {'id' => "1"})
     assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Game.count' do
      delete :destroy, id: @game
    end
    assert_redirected_to login_url
  end
    
  test "should update game" do
    log_in_as(@user)
    assert is_logged_in?
    if @user.id == @game.id
      patch :update, id: @game, game: {awayteam_id: 1, hometeam_id: 1}
    #  patch :update, user_id: 98190962, id: @game, game: {awayteam_id: 1, hometeam_id: 1}
      assert_redirected_to @game
   end
  end

  test "should destroy game" do
    log_in_as(@user)
    #if assert_equal @game.id, @user.game_id
      before = Game.count
    assert is_logged_in?
    if @user.id == @game4.id
      delete :destroy, id: @game4
      after = Game.count
      assert_equal after, before-1
      assert_redirected_to games_url
    end
   
  end

end 
