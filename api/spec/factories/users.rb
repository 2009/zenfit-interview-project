FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
    role "user"
  end
  factory :manager, class: User do
    sequence(:email) { |n| "manager#{n}@example.com" }
    password "password"
    password_confirmation "password"
    role "manager"
  end
  factory :admin, class: User do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password "password"
    password_confirmation "password"
    role "admin"
  end
end
