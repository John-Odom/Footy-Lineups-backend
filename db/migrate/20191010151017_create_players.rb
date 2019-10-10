class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :fifa_rating
      t.string :team_id

      t.timestamps
    end
  end
end
