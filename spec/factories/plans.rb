FactoryBot.define do
  factory :plan do
    sequence(:plan_id) { |n| n }
    sequence(:name) { |n| "TestPlan#{n}" }
    price "3,000"

    after(:create) do |plan|
      create_list(:subscription, 3, plan: plan)
    end
  end
end
