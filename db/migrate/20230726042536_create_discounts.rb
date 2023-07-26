# frozen_string_literal: true

class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :code
      t.integer :discount_percentage

      t.timestamps
    end
  end
end
