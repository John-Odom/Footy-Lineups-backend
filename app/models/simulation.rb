class Simulation < ApplicationRecord
    has_many :simulated_lineups
    has_many :lineups, through: :simulated_lineups
end
