class RemoveTeamFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :team, :string
  end
end
