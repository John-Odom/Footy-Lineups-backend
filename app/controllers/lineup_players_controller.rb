class LineupPlayersController < ApplicationController

    def index
        lineup_players = LineupPlayer.all
        render json: lineup_players
    end
    
end
