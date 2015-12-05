require 'test_helper'
require 'action_view'
include ActionView::Helpers::NumberHelper

class PlayerTest < ActiveSupport::TestCase
  barryBonds = Player.create(:first => "Barry", :last => "Bonds", :hits => 2935, :atbats => 9847, :runs => 2227, :singles => 1495, :doubles => 601, :triples => 77, :homeRuns => 762, :rbis => 1996, :stolenBases => 514, :caughtStealing => 141, :walks => 2558, :strikeouts => 1539, :hitByPitch => 106, :sacrificeFlies => 91, :sacrificeHits => 4, :putouts => 5637, :outfieldAssists => 173, :infieldAssists => 0, :f_errors => 97, :passedBalls => 0, :f_stolenBases => 0, :f_caughtStealing => 0, :wins => 0, :losses => 0, :earnedRuns => 0, :inningsPitched => 0, :gamesStarted => 0, :completeGames => 0, :shutouts => 0, :saves => 0, :p_hits => 0, :p_runs => 0, :p_homeRuns => 0, :p_walks => 0, :p_strikeouts => 0, :p_hitByPitch => 0, :balks => 0, :wildPitches => 0)
  
  molina = Player.create(:first => "Yadier", :last => "Molina", :hits => 1429, :atbats => 5057, :runs => 485, :singles => 1054, :doubles => 270, :triples => 5, :homeRuns => 100, :rbis => 645, :stolenBases => 44, :caughtStealing => 28, :walks => 388, :strikeouts => 521, :hitByPitch => 42, :sacrificeFlies => 48, :sacrificeHits => 41, :putouts => 9434, :outfieldAssists => 0, :infieldAssists => 793, :f_errors => 62, :passedBalls => 64, :f_stolenBases => 354, :f_caughtStealing => 283, :wins => 0, :losses => 0, :earnedRuns => 0, :inningsPitched => 0, :gamesStarted => 0, :completeGames => 0, :shutouts => 0, :saves => 0, :p_hits => 0, :p_runs => 0, :p_homeRuns => 0, :p_walks => 0, :p_strikeouts => 0, :p_hitByPitch => 0, :balks => 0, :wildPitches => 0)

  gray = Player.create(:first => "Sonny", :last => "Gray", :hits => 0, :atbats => 0, :runs => 0, :singles => 0, :doubles => 0, :triples => 0, :homeRuns => 0, :rbis => 0, :stolenBases => 0, :caughtStealing => 0, :walks => 0, :strikeouts => 0, :hitByPitch => 0, :sacrificeFlies => 0, :sacrificeHits => 0, :putouts => 37, :outfieldAssists => 0, :infieldAssists => 74, :f_errors => 4, :passedBalls => 0, :f_stolenBases => 0, :f_caughtStealing => 0, :wins => 14, :losses => 7, :earnedRuns => 63, :inningsPitched => 208, :gamesStarted => 31, :completeGames => 3, :shutouts => 2, :saves => 0, :p_hits => 166, :p_runs => 71, :p_homeRuns => 17, :p_walks => 59, :p_strikeouts => 169, :p_hitByPitch => 2, :balks => 0, :wildPitches => 13)
 
 
  test "bonds num plate appearances" do
    assert_equal(12606, barryBonds.atbats + barryBonds.walks + barryBonds.hitByPitch + barryBonds.sacrificeFlies + barryBonds.sacrificeHits)
  end
  test "bonds num defensive chances" do
    assert_equal(5907, barryBonds.putouts + barryBonds.assists + barryBonds.f_errors)
  end
  test "bonds batting average" do
    assert_equal("0.298", number_with_precision(barryBonds.batavg, precision:3))
  end
  test "bonds on base percentage" do
    assert_equal("0.444", number_with_precision(barryBonds.onBasePercentage, precision:3))
  end
  test "bonds slugging percentage" do
    assert_equal("0.607", number_with_precision(barryBonds.sluggingPercentage, precision:3))
  end
  test "bonds assists" do
    assert_equal(173, barryBonds.assists)
  end
  test "bonds fpct" do
    assert_equal("0.984", number_with_precision(barryBonds.fieldingPercentage, precision:3))
  end

  test "molina num plate appearances" do
    assert_equal(5576, molina.plateAppearances)
  end

  test "molina num assists" do
    assert_equal(793, molina.assists)
  end

  test "molina num defensive chances" do
    assert_equal(10289, molina.defensiveChances)
  end
  test "molina batting average" do
    assert_equal("0.283", number_with_precision(molina.batavg, precision:3))
  end
  test "molina on base percentage" do
    assert_equal("0.336", number_with_precision(molina.onBasePercentage, precision:3))
  end
  test "molina slugging percentage" do
    assert_equal("0.397", number_with_precision(molina.sluggingPercentage, precision:3))
  end
  test "molina fpct" do
    assert_equal("0.994", number_with_precision(molina.fieldingPercentage, precision:3))
  end
  test "molina f caught stealing percentage" do
    assert_equal("44%", number_to_percentage(molina.f_caughtStealingPercentage * 100, precision:0))
  end
  
  test "Gray era" do
    assert_equal("2.73", number_with_precision(gray.earnedRunAverage, precision:2))
  end
  test "Gray whip" do
    assert_equal("1.082", number_with_precision(gray.whip, precision:3))
  end
  test "Gray h9" do
    assert_equal("7.2", number_with_precision(gray.h9, precision:1))
  end
  test "Gray hr9" do
    assert_equal("0.7", number_with_precision(gray.hr9, precision:1))
  end
  test "Gray bb9" do
    assert_equal("2.6", number_with_precision(gray.bb9, precision:1))
  end
  test "Gray k9" do
    assert_equal("7.3", number_with_precision(gray.k9, precision:1))
  end

end
