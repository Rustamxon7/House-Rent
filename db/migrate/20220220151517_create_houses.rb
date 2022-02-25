class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.integer :rooms, null: false
      t.integer :beds, null: false
      t.integer :baths, null: false
      t.integer :price, null: false
      t.integer :rating, null: false
      t.string :image_url, null: false
      t.string :description, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
