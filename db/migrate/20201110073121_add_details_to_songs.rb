class AddDetailsToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :purchases, :integer
    add_column :songs, :available, :boolean
  end
end
