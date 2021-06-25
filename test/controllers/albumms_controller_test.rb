require 'test_helper'

class AlbummsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @albumm = albumms(:one)
  end

  test "should get index" do
    get albumms_url, as: :json
    assert_response :success
  end

  test "should create albumm" do
    assert_difference('Albumm.count') do
      post albumms_url, params: { albumm: { artistid: @albumm.artistid, image: @albumm.image, name: @albumm.name, spotify_id: @albumm.spotify_id, spotify_url: @albumm.spotify_url, total_tracks: @albumm.total_tracks } }, as: :json
    end

    assert_response 201
  end

  test "should show albumm" do
    get albumm_url(@albumm), as: :json
    assert_response :success
  end

  test "should update albumm" do
    patch albumm_url(@albumm), params: { albumm: { artistid: @albumm.artistid, image: @albumm.image, name: @albumm.name, spotify_id: @albumm.spotify_id, spotify_url: @albumm.spotify_url, total_tracks: @albumm.total_tracks } }, as: :json
    assert_response 200
  end

  test "should destroy albumm" do
    assert_difference('Albumm.count', -1) do
      delete albumm_url(@albumm), as: :json
    end

    assert_response 204
  end
end
