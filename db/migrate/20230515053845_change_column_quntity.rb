# frozen_string_literal: true

class ChangeColumnQuntity < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :quntity, :description
  end
end
