class CreateSongsGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :songs_genres do |t|
      t.references :song, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
