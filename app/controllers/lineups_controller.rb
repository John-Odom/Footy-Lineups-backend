class LineupsController < ApplicationController

    def index
        lineups = Lineup.all
        render json: lineups, :include => [:lineup_players, 
            { :team=> {
                :only => :club_name} }, 
            { :comments=> {
                :include => { :user => {
                    :only => :username} }} }, 
            { :user=> {
                :only => :username} },
            { :likes=> {
                :include => { :user => {
                    :only => :username} }} } ]
    end

    def show
        lineup = Lineup.find_by(id:params[:id])
        render json: lineup, include:[:players]
    end

    def create
        
        lineup = Lineup.new(
            "name":params["data"]["name"],
            "user_id":params["user"]["id"],
            "formation":params["data"]["formation"],
            "team_id":params["data"]["selectedClub"]["id"]
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
        lineup.save
        LineupPlayer.create(player_id: goalkeeper["id"], position:"goalkeeper", lineup_id:lineup["id"], player_name:goalkeeper["name"])
        LineupPlayer.create(player_id: lb["id"], position:"lb", lineup_id:lineup["id"], player_name:lb["name"])
        LineupPlayer.create(player_id: lcb["id"], position:"lcb", lineup_id:lineup["id"], player_name:lcb["name"])
        LineupPlayer.create(player_id: rcb["id"], position:"rcb", lineup_id:lineup["id"], player_name:rcb["name"])
        LineupPlayer.create(player_id: rb["id"], position:"rb", lineup_id:lineup["id"], player_name:rb["name"])
        LineupPlayer.create(player_id: cdm["id"], position:"cdm", lineup_id:lineup["id"], player_name:cdm["name"])
        LineupPlayer.create(player_id: lcam["id"], position:"lcam", lineup_id:lineup["id"], player_name:lcam["name"])
        LineupPlayer.create(player_id: rcam["id"], position:"rcam", lineup_id:lineup["id"], player_name:rcam["name"])
        LineupPlayer.create(player_id: lw["id"], position:"lw", lineup_id:lineup["id"], player_name:lw["name"])
        LineupPlayer.create(player_id: st["id"], position:"striker", lineup_id:lineup["id"], player_name:st["name"])
        LineupPlayer.create(player_id: rw["id"], position:"rw", lineup_id:lineup["id"], player_name:rw["name"])
        render json: {id:lineup.id, name:lineup[:name]}, include: [:lineup_players]
    end

    def update
        lineup=Lineup.find(params["id"])
        goalkeeper=Player.find_by(name:params["data"]["goalkeeper"])
        lb=Player.find_by(name:params["data"]["lb"])
        lcb=Player.find_by(name:params["data"]["lcb"])
        rcb=Player.find_by(name:params["data"]["rcb"])
        rb=Player.find_by(name:params["data"]["rb"])
        cdm=Player.find_by(name:params["data"]["cdm"])
        lcam=Player.find_by(name:params["data"]["lcam"])
        rcam=Player.find_by(name:params["data"]["rcam"])
        lw=Player.find_by(name:params["data"]["lw"])
        striker=Player.find_by(name:params["data"]["striker"])
        rw=Player.find_by(name:params["data"]["rw"])
        # team.name = params["teamName"]
        lineup_players = LineupPlayer.where(lineup_id: lineup.id)
        lineup_players.each do |lineup_player|
            lineup_player.destroy
        end
        LineupPlayer.create(player_id: goalkeeper["id"], position:"goalkeeper", lineup_id:lineup["id"], player_name:goalkeeper["name"])
        LineupPlayer.create(player_id: lb["id"], position:"lb", lineup_id:lineup["id"], player_name:lb["name"])
        LineupPlayer.create(player_id: lcb["id"], position:"lcb", lineup_id:lineup["id"], player_name:lcb["name"])
        LineupPlayer.create(player_id: rcb["id"], position:"rcb", lineup_id:lineup["id"], player_name:rcb["name"])
        LineupPlayer.create(player_id: rb["id"], position:"rb", lineup_id:lineup["id"], player_name:rb["name"])
        LineupPlayer.create(player_id: cdm["id"], position:"cdm", lineup_id:lineup["id"], player_name:cdm["name"])
        LineupPlayer.create(player_id: lcam["id"], position:"lcam", lineup_id:lineup["id"], player_name:lcam["name"])
        LineupPlayer.create(player_id: rcam["id"], position:"rcam", lineup_id:lineup["id"], player_name:rcam["name"])
        LineupPlayer.create(player_id: lw["id"], position:"lw", lineup_id:lineup["id"], player_name:lw["name"])
        LineupPlayer.create(player_id: striker["id"], position:"striker", lineup_id:lineup["id"], player_name:striker["name"])
        LineupPlayer.create(player_id: rw["id"], position:"rw", lineup_id:lineup["id"], player_name:rw["name"])
        render json: {id:lineup.id, name:lineup[:name], players:lineup.players}
    end

    def destroy
        lineup = Lineup.find(params[:id])
        # byebug
        lineup.destroy
        render json: {message: "Your team has been deleted!"}
    end
end
