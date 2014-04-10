class ChangeFieldinUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :status
   add_column :users, :verifiedstatus, :boolean
  end
end
