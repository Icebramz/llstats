class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :hometeam_id
      t.integer :awayteam_id

      t.timestamps null: false
    end
  end
end
