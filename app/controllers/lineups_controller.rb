class LineupsController < ApplicationController
    def index
        lineups = Lineup.all
        render json: lineups, include:[:players]   
    end

    def show
        lineup = Lineup.find_by(id:params[:id])
        render json: lineup, include:[:players]
    end

    def create
        byebug
        lineup = Lineup.new(
            "name":params["data"]["name"],
            "user_id":params["data"]["user"]["id"],
            "formation":params["data"]["formation"]
        )
        goalkeeper=Player.find(params["data"]["goalkeeper"][0]["id"])
        lb=Player.find(params["data"]["lb"][0]["id"])
        lcb=Player.find(params["data"]["lcb"][0]["id"])
        rcb=Player.find(params["data"]["rcb"][0]["id"])
        rb=Player.find(params["data"]["rb"][0]["id"])
        cdm=Player.find(params["data"]["cdm"][0]["id"])
        lcam=Player.find(params["data"]["lcam"][0]["id"])
        rcam=Player.find(params["data"]["rcam"][0]["id"])
        lw=Player.find(params["data"]["lw"][0]["id"])
        st=Player.find(params["data"]["striker"][0]["id"])
        rw=Player.find(params["data"]["rw"][0]["id"])
        lineup.players << st
        lineup.players << lw
        lineup.players << rw
        lineup.players << lcam
        lineup.players << rcam
        lineup.players << cdm
        lineup.players << lb
        lineup.players << lcb
        lineup.players << rcb
        lineup.players << rb
        lineup.players << goalkeeper
        lineup.save
        render json: lineup
    end
end
