require 'test_helper'

class AlbumsartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @albumsart = albumsarts(:one)
  end

  test "should get index" do
    get albumsarts_url, as: :json
    assert_response :success
  end

  test "should create albumsart" do
    assert_difference('Albumsart.count') do
      post albumsarts_url, params: { albumsart: { artistid: @albumsart.artistid, artiststrid: @albumsart.artiststrid, image: @albumsart.image, name: @albumsart.name, spotify_id: @albumsart.spotify_id, spotify_url: @albumsart.spotify_url, total_tracks: @albumsart.total_tracks } }, as: :json
    end

    assert_response 201
  end

  test "should show albumsart" do
    get albumsart_url(@albumsart), as: :json
    assert_response :success
  end

  test "should update albumsart" do
    patch albumsart_url(@albumsart), params: { albumsart: { artistid: @albumsart.artistid, artiststrid: @albumsart.artiststrid, image: @albumsart.image, name: @albumsart.name, spotify_id: @albumsart.spotify_id, spotify_url: @albumsart.spotify_url, total_tracks: @albumsart.total_tracks } }, as: :json
    assert_response 200
  end

  test "should destroy albumsart" do
    assert_difference('Albumsart.count', -1) do
      delete albumsart_url(@albumsart), as: :json
    end

    assert_response 204
  end
end
