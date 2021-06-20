class Upshot < ApplicationRecord
  belongs_to :game
  validates :team_a_point, presence: true
  validates :team_b_point, presence: true
  # belongs_to :team_a, foreign_key: :team_a_id, class_name: :team
  # belongs_to :team_b, foreign_key: :team_b_id, class_name: :team
end
