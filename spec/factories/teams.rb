FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "team#{n}" }
  end
  factory :team_a, class: Team do
    name {'Team1'}
  end
  factory :team_b, class: Team do
    name {'Team2'}
  end
end 