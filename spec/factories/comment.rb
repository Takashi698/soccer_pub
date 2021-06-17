FactoryBot.define do
  factory :comment do
    content {'comment1'}
    association :user, factory: :user4
  end
end