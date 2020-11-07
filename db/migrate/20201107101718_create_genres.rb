class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name, limit: 25, null: false

      t.timestamps
    end
  end
end
