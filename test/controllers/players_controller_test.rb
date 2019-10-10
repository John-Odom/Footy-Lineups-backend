require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get players_name_url
    assert_response :success
  end

  test "should get position" do
    get players_position_url
    assert_response :success
  end

  test "should get fifa_rating" do
    get players_fifa_rating_url
    assert_response :success
  end

  test "should get team_id" do
    get players_team_id_url
    assert_response :success
  end

end
