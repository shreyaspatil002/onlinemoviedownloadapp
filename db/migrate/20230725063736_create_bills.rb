# frozen_string_literal: true

class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :Orderable, foreign_key: true
      t.references :product, foreign_key: true
      t.references :cart, foreign_key: true
      t.string :customer_name
      t.decimal :product_price
      t.integer :quantity
      t.decimal :total_product_price
      t.text :address
      t.decimal :cart_price
      t.date :ordered_date
      t.date :dilvery_date

      t.timestamps
    end
  end
end
