# frozen_string_literal: true

class DropDiscountOnQties < ActiveRecord::Migration[5.2]
  def change
    drop_table :discount_on_qties
  end
end
