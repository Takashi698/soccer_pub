FactoryBot.define do
  # factory :upshot, class: Upshot do
  #   # binding.irb
  #   # game_id { }
  #   # team_a_id { Team.find_by(name: 'Team1').id}
  #   # team_b_id { Team.find_by(name: 'Team2').id}
  #   # team_a_point_id { Team.find_by(name: 'Team1').id}
  #   # team_b_point_id { Team.find_by(name: 'Team2').id}
  #   # team_id { }
  # end

  factory :upshot do
    team_a = Team.create(name: "TeamA")
    team_b = Team.create(name: "TeamB")

    team_a_id { team_a.id }
    team_b_id { team_b.id }
    team_a_point { 2 }
    team_b_point { 3 }
    association :game
    # binding.pry
    # association :team, factory: :team_a, name: "TeamA"
    # association :team, factory: :team_b, name: "TeamB"
    # association :team, aliases: [:team_b]

    # team_a_id { Team.first }
    # team_b_id { Team.second }
  end

end