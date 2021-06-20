class Team < ApplicationRecord
  has_many :upshots, dependent: :destroy
  mount_uploader :image, ImageUploader

  def self.transform_for_select_input
    Team.all.map { |team| return [team.name, team.id] }
  end

  def self.findRandom
    teams = Team.all
    teams.sample(1).first
  end
end
