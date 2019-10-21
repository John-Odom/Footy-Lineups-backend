class Team < ApplicationRecord
    has_many :players
    has_many :lineups
    has_many :users
end
