class AddPositionToLineupPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :lineup_players, :position, :string
  end
end
