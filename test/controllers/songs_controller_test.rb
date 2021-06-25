require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @song = songs(:one)
  end

  test "should get index" do
    get songs_url, as: :json
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post songs_url, params: { song: { duration: @song.duration, name: @song.name, preview_url: @song.preview_url, spotify_id: @song.spotify_id, spotify_url: @song.spotify_url, total_tracks: @song.total_tracks } }, as: :json
    end

    assert_response 201
  end

  test "should show song" do
    get song_url(@song), as: :json
    assert_response :success
  end

  test "should update song" do
    patch song_url(@song), params: { song: { duration: @song.duration, name: @song.name, preview_url: @song.preview_url, spotify_id: @song.spotify_id, spotify_url: @song.spotify_url, total_tracks: @song.total_tracks } }, as: :json
    assert_response 200
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete song_url(@song), as: :json
    end

    assert_response 204
  end
end
