class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first
      t.string :last
      t.integer :hits
      t.integer :assists
      t.integer :atbats
      t.float :batavg
      t.references :team, index: true, foreign_key: true
      t.integer :runs
      t.integer :singles
      t.integer :doubles
      t.integer :triples
      t.integer :homeRuns
      t.integer :rbis
      t.integer :stolenBases
      t.integer :caughtStealing
      t.integer :walks
      t.integer :strikeouts
      t.integer :hitByPitch
      t.integer :sacrificeHits
      t.integer :sacrificeFlies
      t.integer :plateAppearances
      t.float :onBasePercentage
      t.float :sluggingPercentage
      t.float :caughtStealingPercentage
      t.integer :putouts
      t.integer :outfieldAssists
      t.integer :infieldAssists
      t.integer :f_errors
      t.integer :assists
      t.integer :defensiveChances
      t.float :fieldingPercentage
      t.integer :passedBalls
      t.integer :f_stolenBases
      t.integer :f_caughtStealing
      t.float :f_caughtStealingPercentage
      t.integer :wins
      t.integer :losses
      t.integer :earnedRuns
      t.float :inningsPitched
      t.integer :gamesStarted
      t.integer :completeGames
      t.integer :shutouts
      t.integer :saves
      t.integer :p_hits
      t.integer :p_runs
      t.integer :p_homeRuns
      t.integer :p_walks
      t.integer :p_strikeouts
      t.integer :p_hitByPitch
      t.integer :balks
      t.integer :wildPitches
      t.float :earnedRunAverage
      t.float :whip
      t.float :h9
      t.float :hr9
      t.float :bb9
      t.float :k9

      t.timestamps null: false
    end
  end
end
