class PlayersController < ApplicationController
    def index
        players = Player.all
        render json: players, except: [:created_at, :updated_at] 
    end

    def show
        player=Player.find_by(id: params[:id])
        render json: player, except: [:created_at, :updated_at] 
    end
end
