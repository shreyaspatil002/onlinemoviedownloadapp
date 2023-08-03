class AddColumnCustomerIdToOrderables < ActiveRecord::Migration[5.2]
  def change
    add_column :orderables, :customer_id, :integer
  end
end
