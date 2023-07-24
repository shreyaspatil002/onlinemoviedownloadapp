# frozen_string_literal: true

class AddAddressToOrderable < ActiveRecord::Migration[5.2]
  def change
    add_column :orderables, :address, :text
  end
end
