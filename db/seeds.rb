require 'faker'
require 'rest-client' 
require'pry'

Player.delete_all
LineupPlayer.delete_all
Lineup.delete_all
SimulatedLineup.delete_all
Simulation.delete_all
Comment.delete_all
Like.delete_all
Team.delete_all
User.delete_all



# get the entire prem league data and parse to recieve an array of teamObjects with nested players
premeier_league_api = RestClient.get "https://apiv2.apifootball.com/?action=get_teams&league_id=148&APIkey=aed9f8c219f767c81379c3500ccecf7ff5234d349f789af350e8f106f20c781c"
prem_team_objects=JSON.parse(premeier_league_api)

#create the teams and players and associate them together. given fake fifa_rating for seed data
prem_team_objects.each do |team|
    newTeam = Team.create(club_name: team["team_name"], badge: team["team_badge"])
    team["players"].each do |player|
        Player.create(
            name:player["player_name"], 
            position:player["player_type"], 
            fifa_rating: rand(60...100), 
            team_id:newTeam.id)
    end
end

#create some Users with mock data 
User.create(username:"john", password:"1234", bio:"password is 1234")
User.create(username:"alex", password:"1234", bio:"password is 1234")
User.create(username:"jboss", password:"1234", bio:"password is 1234")
User.create(username:"tiffany", password:"1234", bio:"password is 1234")

# create lineups and associate to users
User.all.each do |user|
    newLineup = Lineup.create(name: "#{user.username}'s lineup'", formation:"4-4-2", user_id:user.id)
end

# add players to lineup in a random order so we have multiple different lineups.
# add 2 comments to each lineup
Lineup.all.each do |lineup|
    11.times do
        lineup.players.push(Player.find_by(id: (Player.last.id-rand(1...300))))
    end
    2.times do
        commenter = User.find_by(id: User.last.id-rand(0..3))
        Comment.create(content: "#{commenter.username} says this is amazing", user_id:commenter.id, lineup_id:lineup.id)
    end
    Like.create(user_id:User.last.id, lineup_id: lineup.id)
end

# create 2 simulations so that each lineup simmed once
# sim1 = Simulation.create(first_lineup_id:Lineup.first.id, second_lineup_id:Lineup.second.id, score:"3-1")
# sim2 = Simulation.create(first_lineup_id:Lineup.third.id, second_lineup_id:Lineup.fourth.id, score: "0-1")

