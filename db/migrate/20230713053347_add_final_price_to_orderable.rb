class AddFinalPriceToOrderable < ActiveRecord::Migration[5.2]
  def change
    add_column :orderables, :final_price, :numeric
  end
end
