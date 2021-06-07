class Upshot < ApplicationRecord
  belongs_to :game
  # belongs_to :team_a, foreign_key: :team_a_id, class_name: :team
  # belongs_to :team_b, foreign_key: :team_b_id, class_name: :team
end
