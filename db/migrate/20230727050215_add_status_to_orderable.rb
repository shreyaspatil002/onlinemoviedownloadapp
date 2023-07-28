class AddStatusToOrderable < ActiveRecord::Migration[5.2]
  def change
    add_column :orderables, :status, :string
  end
end
