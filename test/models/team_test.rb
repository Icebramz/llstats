require File.expand_path("../../test_helper", __FILE__)

class TeamTest < ActiveSupport::TestCase
      ########################### Team validation Checks ####################################################
	test "team should have the necessary required validators" do
	  team = Team.new
	  assert_not team.valid?
	  assert_equal [:name, :division], team.errors.keys
	end

        test "only allow letter in team name" do
	  team = Team.new(name: 'team1', division: 1)
	  assert_not team.valid?
	  assert_equal ["Only Letters, Hyphens, and Apostrophes  are allowed"], team.errors.messages[:name]
	end

        test "division should not be negative number" do
	  team = Team.new(name: 'team1', division: -1)
	  assert_not team.valid?
	  assert_equal ["must be greater than or equal to 0"], team.errors.messages[:division]
	end
        ########################### Team validation Checks ends####################################################
        ##########################Association with Player ############################################################
        test 'association with players - Create players with stats' do
	    team = teams(:one)
            player = team.players.new
            player.initializePlayerStats()
            player.first = "abdull"
            player.last = "alkalbi"
            player.hits = 6
            player.atbats = 2
            player.f_caughtStealingPercentage = 0
            player.save
	    assert_equal(team.id, player.team_id)
	    assert_equal(player.batavg, 3)#because self.batavg = self.hits.to_f / self.atbats
	  end
          test 'association with players - Player should delete when team destroy' do
	    team = teams(:one)
            player = team.players.new
            player.initializePlayerStats()
            player.first = "abdull"
            player.last = "alkalbi"
            player.hits = 6
            player.atbats = 2
            player.f_caughtStealingPercentage = 0
            player.save
	    team.destroy()
            assert_nil Player.find_by_id(player.id)
	  end
        ##########################Association with Player ends ############################################################
        ############################Paperclip File attachment test #############################################################

          test "upload team logo" do
             @logo = File.new(File.join(Rails.root, "/test/fixtures/paperclip", "photo.jpeg"), 'rb')
             @team = Team.create!(:name=>"falcons",:division =>2, :avatar => @logo) 
             assert @team.avatar_file_name == "photo.jpeg"
          end
          test "logo should be of valid content type" do
             @logo = File.new(File.join(Rails.root, "/test/fixtures/paperclip", "photo1.jpeg"), 'w')
             @team = Team.create(:name=>"falcons with logo",:division =>2, :avatar => @logo) 
             assert_equal ["has contents that are not what they are reported to be", "is invalid"],@team.errors.messages[:avatar]
          end
       ############################Paperclip File attachment test ends #############################################################

	  

  
end
