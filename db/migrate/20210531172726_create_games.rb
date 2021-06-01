class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.text :content
      t.string :place
      t.datetime :match_at
      t.references :user, foreign_key: true
    end
  end
end
