class AddDiscountToOrderable < ActiveRecord::Migration[5.2]
  def change
    add_column :orderables, :discount, :decimal
  end
end
