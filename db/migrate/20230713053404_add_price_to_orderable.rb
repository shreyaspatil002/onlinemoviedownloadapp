# frozen_string_literal: true

class AddPriceToOrderable < ActiveRecord::Migration[5.2]
  def change
    add_column :orderables, :price, :numeric
  end
end
