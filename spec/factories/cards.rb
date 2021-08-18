FactoryBot.define do
  factory :card do
    sequence(:card_id) { |n| n }
    sequence(:number) { |n| "111122223333444#{n}" }
    default "false"
    brand "Visa"
    association :user
  end
end
