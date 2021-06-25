require 'test_helper'

class AlbumartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @albumart = albumarts(:one)
  end

  test "should get index" do
    get albumarts_url, as: :json
    assert_response :success
  end

  test "should create albumart" do
    assert_difference('Albumart.count') do
      post albumarts_url, params: { albumart: { artistid: @albumart.artistid, image: @albumart.image, name: @albumart.name, spotify_id: @albumart.spotify_id, spotify_url: @albumart.spotify_url, total_tracks: @albumart.total_tracks } }, as: :json
    end

    assert_response 201
  end

  test "should show albumart" do
    get albumart_url(@albumart), as: :json
    assert_response :success
  end

  test "should update albumart" do
    patch albumart_url(@albumart), params: { albumart: { artistid: @albumart.artistid, image: @albumart.image, name: @albumart.name, spotify_id: @albumart.spotify_id, spotify_url: @albumart.spotify_url, total_tracks: @albumart.total_tracks } }, as: :json
    assert_response 200
  end

  test "should destroy albumart" do
    assert_difference('Albumart.count', -1) do
      delete albumart_url(@albumart), as: :json
    end

    assert_response 204
  end
end
