# frozen_string_literal: true

class AddStatusToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :status, :boolean
  end
end
