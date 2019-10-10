class CreateLineupPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :lineup_players do |t|
      t.string :players_id
      t.string :lineups_id

      t.timestamps
    end
  end
end
