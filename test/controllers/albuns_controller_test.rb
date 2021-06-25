require 'test_helper'

class AlbunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @albun = albuns(:one)
  end

  test "should get index" do
    get albuns_url, as: :json
    assert_response :success
  end

  test "should create albun" do
    assert_difference('Albun.count') do
      post albuns_url, params: { albun: { artistid: @albun.artistid, artiststrid: @albun.artiststrid, image: @albun.image, name: @albun.name, spotify_id: @albun.spotify_id, spotify_url: @albun.spotify_url, total_tracks: @albun.total_tracks } }, as: :json
    end

    assert_response 201
  end

  test "should show albun" do
    get albun_url(@albun), as: :json
    assert_response :success
  end

  test "should update albun" do
    patch albun_url(@albun), params: { albun: { artistid: @albun.artistid, artiststrid: @albun.artiststrid, image: @albun.image, name: @albun.name, spotify_id: @albun.spotify_id, spotify_url: @albun.spotify_url, total_tracks: @albun.total_tracks } }, as: :json
    assert_response 200
  end

  test "should destroy albun" do
    assert_difference('Albun.count', -1) do
      delete albun_url(@albun), as: :json
    end

    assert_response 204
  end
end
