class Game < ApplicationRecord
  belongs_to :user

  has_one :upshot, dependent: :destroy
  accepts_nested_attributes_for :upshot, allow_destroy: true
  
  has_many :comments, dependent: :destroy
  # has_many :teams, dependent: :destroy

  validates :content, presence: true, length: {maximum: 1000}
  validates :place, presence: true 

  # validates :team_a, presence: true, if: :same_team_name 
  # validates :team_b, presence: true, if: :same_team_name 
  

  # def same_team_name
  #   team_a == team_b
  # end 

  # validates :match_at, presence: true
  # enum place:{ Osaka: 0, Tokyo: 1, Fukuoka: 2, Hiroshima: 3, Sendai: 4, Chiba: 5 }

  def self.new_and_build
    game = Game.new
    game.build_upshot
    # game.upshots.build
    return game
  end

  def team_a
    self.upshot.team_a_id if self.upshot
  end

  def team_b
    self.upshot.team_b_id if self.upshot
  end

  def team_a?
    self.upshot.present? && self.upshot.team_a.present?
  end

  def team_b?
    self.upshot.present? && self.upshot.team_b.present?
  end

  # def managable?(user)
  #   return user.id == self.user_id || user.admin
  # end
end
