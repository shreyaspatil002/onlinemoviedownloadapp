# frozen_string_literal: true

class CreateOrderables < ActiveRecord::Migration[5.2]
  def change
    create_table :orderables do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :cart, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
