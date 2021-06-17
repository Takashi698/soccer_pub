FactoryBot.define do
  factory :user do
    name {'test_user1'}
    email {'test1@example.com'}
    password {'password'}
  end

  factory :user2, class: User do
    name {'test_user2'}
    email {'test2@example.com'}
    password {'password'}
  end

  factory :user3, class: User do
    name {'test_user3'}
    email {'test3@example.com'}
    password {'password'}
  end

  factory :user4, class: User do
    name {'test_user4'}
    email {'test4@example.com'}
    password {'password'}
  end

  factory :user5, class: User do
    name {'user_model5'}
    email {'test5@example.com'}
    password {'password'}
  end

  factory :user6, class: User do
    name {'user_model6'}
    email {'test6@example.com'}
    password {'password'}
  end

  factory :user7, class: User do
    name {'user_model7'}
    email {'test7@example.com'}
    password {'password'}
  end

  factory :user8, class: User do
    name {'user_model8'}
    email {'test8@example.com'}
    password {'password'}
  end

  factory :user9, class: User do
    name {'user_model9'}
    email {'test9@example.com'}
    password {'password'}
    admin {true}
  end

end 