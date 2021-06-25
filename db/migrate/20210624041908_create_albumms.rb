class CreateAlbumms < ActiveRecord::Migration[5.2]
  def change
    create_table :albumms do |t|
      t.string :name
      t.string :image
      t.string :spotify_url
      t.string :total_tracks
      t.string :spotify_id
      t.string :artistid

      t.timestamps
    end
  end
end
