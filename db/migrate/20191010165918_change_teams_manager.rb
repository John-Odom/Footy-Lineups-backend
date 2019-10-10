class ChangeTeamsManager < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :manager, :badge
  end
end
