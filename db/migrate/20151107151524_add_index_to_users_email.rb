class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    #adds index on the email column of the users table
    #the option "unique: :true" enforces uniqueness
    #this added index fixes a potential efficiency problem prventing a full-table scan when finding users by email address
  end
end
