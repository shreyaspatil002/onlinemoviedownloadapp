# frozen_string_literal: true

class DropBill < ActiveRecord::Migration[5.2]
  def change
    drop_table :bills
  end
end
