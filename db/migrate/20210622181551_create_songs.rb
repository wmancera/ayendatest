class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :spotify_url
      t.string :preview_url
      t.integer :duration
      t.string :total_tracks
      t.string :spotify_id

      t.timestamps
    end
  end
end
