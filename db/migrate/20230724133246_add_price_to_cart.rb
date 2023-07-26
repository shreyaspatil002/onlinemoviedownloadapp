# frozen_string_literal: true

class AddPriceToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :price, :number
  end
end
