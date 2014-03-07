class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :company
      t.decimal :hourly_rate, precision: 5, scale: 2
      t.decimal :hours, precision: 5, scale: 2
      t.decimal :pay_due, precision: 5, scale: 2

      t.timestamps
    end
  end
end
