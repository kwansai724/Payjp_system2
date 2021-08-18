require 'rails_helper'

RSpec.describe Plan, type: :model do
  it "プランIDがなければ無効な状態であること" do
    plan = build(:plan, plan_id: nil)
    plan.valid?
    expect(plan.errors[:plan_id]).to include("を入力してください")
  end

  it "プラン名がなければ無効な状態であること" do
    plan = build(:plan, name: nil)
    plan.valid?
    expect(plan.errors[:name]).to include("を入力してください")
  end

  it "プラン料金がなければ無効な状態であること" do
    plan = build(:plan, price: nil)
    plan.valid?
    expect(plan.errors[:price]).to include("を入力してください")
  end

end
