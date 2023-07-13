class AddCustomerNameToOrderable < ActiveRecord::Migration[5.2]
  def change
    add_column :orderables, :customer_name, :string
  end
end
