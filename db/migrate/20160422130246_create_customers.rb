class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
