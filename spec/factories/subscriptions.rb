FactoryBot.define do
  factory :subscription do
    sequence(:subscription_id) { |n| n }
    sequence(:user_id) { |u| u }
    sequence(:plan_id) { |i| i }
    association :plan
  end
end
