class CreateUpshots < ActiveRecord::Migration[5.2]
  def change
    create_table :upshots do |t|
      t.integer :game_id
      t.integer :team_a_id
      t.integer :team_b_id
      t.integer :team_a_point
      t.integer :team_b_point
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
