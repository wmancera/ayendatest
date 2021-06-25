json.extract! albumm, :id, :name, :image, :spotify_url, :total_tracks, :spotify_id, :artistid, :created_at, :updated_at
json.url albumm_url(albumm, format: :json)
