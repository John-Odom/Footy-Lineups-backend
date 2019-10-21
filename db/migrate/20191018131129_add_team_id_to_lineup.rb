class AddTeamIdToLineup < ActiveRecord::Migration[5.2]
  def change
    add_column :lineups, :team_id, :integer
  end
end
