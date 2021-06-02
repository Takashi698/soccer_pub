class Team < ApplicationRecord
  has_many :upshots, dependent: :destroy
end
