FactoryBot.define do

  factory :game do
    content {'test1'}
    place {'test1'}
    match_at {DateTime.new}
    association :user
    # factory :team do
    #   name { "Team1" }
    #   description { "Team1_description" }
    # end

    # factory :team2, class: Team do
    #   name { "Team2" }
    #   description { "Team2_description" }
    # end

  end

  factory :game2, class: Game do
    content {"game2_content"}
    place {"game2_place"}
    match_at {DateTime.new -10}
  end

  factory :game3, class: Game do
    content {"game3_content"}
    place {"game3_place"}
    match_at {DateTime.new -5}
  end
end 