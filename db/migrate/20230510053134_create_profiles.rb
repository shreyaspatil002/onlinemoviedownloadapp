class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :zip_code
      t.integer :mobile
      t.references :user, foreign_key: true, index: true 

      t.timestamps
    end
  end
end
