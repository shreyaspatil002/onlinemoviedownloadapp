# frozen_string_literal: true

class DropDiscounts < ActiveRecord::Migration[5.2]
  def change
    drop_table :discounts
  end
end
