require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、性別、生年月日、住所、パスワードがあれば有効な状態であること" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前がなければ無効な状態であること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "名前が２文字未満であれば無効な状態であること" do
    user = FactoryBot.build(:user, name: "あ")
    user.valid?
    expect(user.errors[:name]).to include("は2文字以上で入力してください")
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "メールアドレスが100文字以内でなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: "AaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaa@email.com")
    user.valid?
    expect(user.errors[:email]).to include("は100文字以内で入力してください")
  end

  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:user, email: "test1@email.com")
    user = FactoryBot.build(:user, email: "test1@email.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "性別がなければ無効な状態であること" do
    user = FactoryBot.build(:user, gender: nil)
    user.valid?
    expect(user.errors[:gender]).to include("を入力してください")
  end

  it "生年月日がなければ無効な状態であること" do
    user = FactoryBot.build(:user, birthday: nil)
    user.valid?
    expect(user.errors[:birthday]).to include("を入力してください")
  end

  it "住所がなければ無効な状態であること" do
    user = FactoryBot.build(:user, address: nil)
    user.valid?
    expect(user.errors[:address]).to include("を入力してください")
  end

end
