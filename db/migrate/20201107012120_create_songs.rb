class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name, limit: 50, null: false
      t.text :description, limit: 250
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :exclusive_price, precision: 10, scale: 2, null: false
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
