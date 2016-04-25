class ChangePhoneToString < ActiveRecord::Migration
  def change
  	change_column :customers, :phone,  :string 
  end
end
