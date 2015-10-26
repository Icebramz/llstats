class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first
      t.string :last
      t.integer :hits
      t.integer :assists
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
