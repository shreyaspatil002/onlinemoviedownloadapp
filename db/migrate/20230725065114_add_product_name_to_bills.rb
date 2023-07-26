# frozen_string_literal: true

class AddProductNameToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :product_name, :string
  end
end
