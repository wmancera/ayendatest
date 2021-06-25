require 'rspotify'
require 'ostruct'
namespace :readartists do
  desc "load data from file yaml"
  task :read_file => :environment do
      require 'yaml'
      config =YAML.load_file('artists.yaml')
      config.each do |key, value|
        if(value != '-')
          #Define artist
          artistObjet = processArtistName(value)       
        end
    end
  end
end

def processArtistName(value)
  @art = Artist.new
  artists = RSpotify::Artist.search(value.to_s)
  artist = artists.first
  artists.each do |objeto|
      objeto.images.each do |key|
        image = OpenStruct.new(key)
        @art.image = image.url.to_s
      end
      @art.popularity = objeto.popularity
      @art.genres = objeto.genres
      artistsbase = RSpotify::Base.search(objeto.name.to_s, 'artist')
      artistsbase.each do |objetob|
        @art.spotify_id = objetob.id.to_s
        @art.spotify_url = objetob.uri.to_s
      end
      @art.name = objeto.name.to_s
      #Process Albums
      processAlbums(objeto.albums(),@art.spotify_id)
      #Now we consult the albums
  end
  #@art.save 
end

def processAlbums(albums,idartist)
    @album = Albumm.new
    albumI = albums.first
    @album.name = albumI.name.to_s
    albumBase  = RSpotify::Base.search(albumI.name.to_s, 'album', limit: 1, market: 'US')
    albumBase.each do |baseObject|
      @album.spotify_id = baseObject.id.to_s
      @album.spotify_url = baseObject.uri.to_s
    end
    albumI.images.each do |key|
      image = OpenStruct.new(key)
      @album.image = image.url.to_s
    end  
    @album.name = albumI.name.to_s
    @album.total_tracks = albumI.total_tracks
    @album.artistid = idartist 
    puts @album.artistid
    @album.save
end  