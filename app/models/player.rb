class Player < ApplicationRecord
    has_many :lineup_players
    has_many :lineups, through: :lineup_players
end
