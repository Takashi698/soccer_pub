FactoryBot.define do
  factory :team_a, class: Team do
    name {'Team1'}
  end
  factory :team_b, class: Team do
    name {'Team2'}
  end
  factory :upshot, class: Upshot do
    team_a_id { Team.find_by(name: 'Team1').id}
    team_b_id { Team.find_by(name: 'Team2').id}
    team_a_point_id { Team.find_by(name: 'Team1').id}
    team_b_point_id { Team.find_by(name: 'Team2').id}
  end
end 