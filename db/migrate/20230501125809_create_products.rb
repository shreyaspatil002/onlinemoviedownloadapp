# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.float :price
      t.boolean :is_active, default: true
      t.string :description

      t.timestamps
    end
  end
end
