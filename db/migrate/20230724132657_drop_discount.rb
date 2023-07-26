# frozen_string_literal: true

class DropDiscount < ActiveRecord::Migration[5.2]
  def change
    drop_table :discounts
  end
end
