class AddUserIdToBill < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :user_id, :integer
  end
end
