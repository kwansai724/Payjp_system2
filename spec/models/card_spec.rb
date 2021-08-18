require 'rails_helper'

RSpec.describe Card, type: :model do
  it "ユーザーはカードを複数持つことが出来ること" do
    expect(build(:card)).to be_valid
  end

  it "カード番号がなければ無効な状態であること" do
    card = build(:card, number: nil)
    card.valid?
    expect(card.errors[:number]).to include("を入力してください")
  end

  it "ブランドがなければ無効な状態であること" do
    card = build(:card, brand: nil)
    card.valid?
    expect(card.errors[:brand]).to include("を入力してください")
  end

end
