FactoryBot.define do
  factory :user do
    name "TestUser"
    sequence(:email) { |n| "sample#{n}@email.com" }
    gender "女性"
    birthday "1989-07-24"
    address "大阪市"
    password "password"
    password_confirmation "password"

    after(:create) do |user|
      create_list(:card, 3, user: user)
    end
  end
end
