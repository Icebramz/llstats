class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
	#adding false means that the users will not be administrators by default
  end
end
