class AddPlayerNameToLineupPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :lineup_players, :player_name, :string
  end
end
