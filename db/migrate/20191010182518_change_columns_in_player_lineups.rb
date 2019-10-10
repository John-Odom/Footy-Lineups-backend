class ChangeColumnsInPlayerLineups < ActiveRecord::Migration[5.2]
  def change
    rename_column :lineup_players, :players_id, :player_id
    rename_column :lineup_players, :lineups_id, :lineup_id
  end
end
