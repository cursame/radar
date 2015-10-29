FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password 'secretpassword'
    password_confirmation 'secretpassword'
    institution

    trait :male do
      gender 0
    end

    trait :female do
      gender 1
    end

    trait :accepted_terms do
      accepted_terms true
    end

    trait :unaccepted_terms do
      accepted_terms false
    end

    factory :superadmin do
      after(:create) { |user| user.add_role :superadmin }
    end

    factory :admin do
      after(:create) { |user| user.add_role :admin }
    end
  end
end
