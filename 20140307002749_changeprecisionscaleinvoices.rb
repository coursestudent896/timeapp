class Changeprecisionscaleinvoices < ActiveRecord::Migration
  def change
  	 def up
   change_column :invoices, :pay_due, :precision => 10, :scale => 4
  end
end
end
