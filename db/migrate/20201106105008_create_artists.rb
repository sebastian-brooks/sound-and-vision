class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name, limit: 50, null: false
      t.text :description, limit: 250
      t.string :email, limit: 100, null: false
      t.string :website, limit: 100
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
