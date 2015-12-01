class AddHomeFieldsToGame < ActiveRecord::Migration
  def change
    add_column :games, :home_inningone, :integer
    add_column :games, :home_inningtwo, :integer
    add_column :games, :home_inningthree, :integer
    add_column :games, :home_inningfour, :integer
    add_column :games, :home_inningfive, :integer
    add_column :games, :home_inningsix, :integer
    add_column :games, :home_inningseven, :integer
    add_column :games, :home_inningeight, :integer
    add_column :games, :home_inningnine, :integer
    add_column :games, :home_runs, :integer
    add_column :games, :home_hits, :integer
    add_column :games, :home_error, :integer
    add_column :games, :home_score, :integer
  end
end
