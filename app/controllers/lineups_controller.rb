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
            "name":params["name"],
            "user_id":params["user"]["id"],
            "formation":params["formation"],
            "team_id":params["team"]["id"]
        )
        goalkeeper=Player.find(params["playersInLineup"]["goalkeeper"]["id"])
        lb=Player.find(params["playersInLineup"]["lb"]["id"])
        lcb=Player.find(params["playersInLineup"]["lcb"]["id"])
        rcb=Player.find(params["playersInLineup"]["rcb"]["id"])
        rb=Player.find(params["playersInLineup"]["rb"]["id"])
        cdm=Player.find(params["playersInLineup"]["cdm"]["id"])
        lcam=Player.find(params["playersInLineup"]["lcam"]["id"])
        rcam=Player.find(params["playersInLineup"]["rcam"]["id"])
        lw=Player.find(params["playersInLineup"]["lw"]["id"])
        striker=Player.find(params["playersInLineup"]["striker"]["id"])
        rw=Player.find(params["playersInLineup"]["rw"]["id"])
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
        LineupPlayer.create(player_id: striker["id"], position:"striker", lineup_id:lineup["id"], player_name:striker["name"])
        LineupPlayer.create(player_id: rw["id"], position:"rw", lineup_id:lineup["id"], player_name:rw["name"])
        render json: {id:lineup.id, name:lineup[:name]}, include: [:lineup_players]
    end

    def update
        lineup=Lineup.find(params["id"])
        goalkeeper=Player.find_by(name:params["goalkeeper"])
        lb=Player.find_by(name:params["lb"])
        lcb=Player.find_by(name:params["lcb"])
        rcb=Player.find_by(name:params["rcb"])
        rb=Player.find_by(name:params["rb"])
        cdm=Player.find_by(name:params["cdm"])
        lcam=Player.find_by(name:params["lcam"])
        rcam=Player.find_by(name:params["rcam"])
        lw=Player.find_by(name:params["lw"])
        striker=Player.find_by(name:params["striker"])
        rw=Player.find_by(name:params["rw"])
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
