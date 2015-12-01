class AddAwayFieldsToGame < ActiveRecord::Migration
  def change
    add_column :games, :away_inningone, :integer
    add_column :games, :away_inningtwo, :integer
    add_column :games, :away_inningthree, :integer
    add_column :games, :away_inningfour, :integer
    add_column :games, :away_inningfive, :integer
    add_column :games, :away_inningsix, :integer
    add_column :games, :away_inningseven, :integer
    add_column :games, :away_inningeight, :integer
    add_column :games, :away_inningnine, :integer
    add_column :games, :away_runs, :integer
    add_column :games, :away_hits, :integer
    add_column :games, :away_error, :integer
    add_column :games, :away_score, :integer
  end
end
