class ChangeVerifiedStatusFieldinUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :verifiedstatus
   add_column :users, :verifiedstatus, :boolean
  end
end
