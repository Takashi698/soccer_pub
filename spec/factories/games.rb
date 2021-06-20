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
    association :user, factory: :user2
  end

  factory :game3, class: Game do
    content {"game3_content"}
    place {"game3_place"}
    match_at {DateTime.new -5}
    association :user, factory: :user3
  end

  factory :game4, class: Game do
    content {"game4_content"}
    place {"game4_place"}
    match_at {DateTime.new -15}
    association :user, factory: :user4
  end

  factory :game5, class: Game do
    content {"game5_content"}
    place {"game5_place"}
    match_at {DateTime.new -20}
    association :user, factory: :user5
  end

  factory :game6, class: Game do
    content {"game6_content"}
    place {"game6_place"}
    match_at {DateTime.new -25}
    association :user, factory: :user6
  end

  factory :game7, class: Game do
    content {"game7_content"}
    place {"game7_place"}
    match_at {DateTime.new -30}
    association :user, factory: :user7
  end

end 