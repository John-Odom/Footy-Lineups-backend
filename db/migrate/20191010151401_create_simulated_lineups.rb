class CreateSimulatedLineups < ActiveRecord::Migration[5.2]
  def change
    create_table :simulated_lineups do |t|
      t.string :simulation_id
      t.string :lineup_id

      t.timestamps
    end
  end
end
