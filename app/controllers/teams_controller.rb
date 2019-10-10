class TeamsController < ApplicationController
    def index
        teams = Team.all
        render json: teams, include:[:players], except: [:created_at, :updated_at] 
    end

    def show
        team=Team.find_by(id: params[:id])
        render json: {id: team.id, name: team.club_name, players: team.players}
    end

end
