class ChangeColumnsToIntegers < ActiveRecord::Migration[5.2]
  def change
    change_column :lineup_players, :player_id, 'integer USING CAST(player_id AS integer)'
    change_column :lineup_players, :lineup_id, 'integer USING CAST(lineup_id AS integer)'
  end
end
