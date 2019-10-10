class LineupsController < ApplicationController
    def index
        lineups = Lineup.all
        render json: lineups, include:[:players]   
    end

    def show
        lineup = Lineup.find_by(id:params[:id])
        render json: lineup, include:[:players]
    end
end
