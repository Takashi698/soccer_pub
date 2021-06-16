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
  
end 