# frozen_string_literal: true

class DropRatingCaches < ActiveRecord::Migration[5.2]
  def change
    drop_table :rating_caches
  end
end
