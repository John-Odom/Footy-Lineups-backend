class AddLineupIdsToSimulations < ActiveRecord::Migration[5.2]
  def change
    add_column :simulations, :first_lineup_id, :integer
    add_column :simulations, :second_lineup_id, :integer
  end
end
