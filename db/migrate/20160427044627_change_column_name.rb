class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :transaction_details, :order_id, :transaction_id
  	rename_column :transactions, :cart_id, :order_id
  	remove_foreign_key :orders, :order_statuses

  end
end
