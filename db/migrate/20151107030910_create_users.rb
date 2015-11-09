class CreateUsers < ActiveRecord::Migration
  def change #this method determines change to be made to DB
    create_table :users do |t| #create_table method accepts a block w/ 1 block variable, t for "table" here
#t object is used to create name & email columns in the DB
      t.string :name
      t.string :email

      t.timestamps null: false
#t.timestamples creates two "magic" columns called "created_at" & "updated_at" which are timestamps that automatically record when a given user is created and updated
    end
  end
end
