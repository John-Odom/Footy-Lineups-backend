class CreateLineups < ActiveRecord::Migration[5.2]
  def change
    create_table :lineups do |t|
      t.string :name
      t.string :user_id
      t.string :formation

      t.timestamps
    end
  end
end
