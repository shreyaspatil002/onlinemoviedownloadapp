# frozen_string_literal: true

class RemoveUsersIdFromReview < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :users_id, :integer
  end
end
