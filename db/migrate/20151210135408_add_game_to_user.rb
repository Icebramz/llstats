class AddGameToUser < ActiveRecord::Migration
  def change
    add_reference :users, :game, index: true, foreign_key: true
  end
end
