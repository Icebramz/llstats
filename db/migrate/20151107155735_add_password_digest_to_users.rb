class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    #"add_column" method is used to add a "password_digest_ column to the users table
  end
end
