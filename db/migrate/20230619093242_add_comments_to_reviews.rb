class AddCommentsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :comments, :text
  end
end
