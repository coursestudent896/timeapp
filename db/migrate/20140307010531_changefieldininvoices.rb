class Changefieldininvoices < ActiveRecord::Migration
  def change
   remove_column :invoices, :pay_due
   add_column :invoices, :pay_due, :decimal

  end
end
