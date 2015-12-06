class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :inning
      t.string :player_name
      t.string :home_away
      t.string :message
      t.integer :balls
      t.integer :strikes
      t.integer :out
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
