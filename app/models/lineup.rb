class Lineup < ApplicationRecord
    belongs_to :user
    belongs_to :team
    has_many :lineup_players
    has_many :players, through: :lineup_players
    has_many :comments
    has_many :likes
    has_many :simulated_lineups
    has_many :simulations, through: :simulated_lineups

    

end
