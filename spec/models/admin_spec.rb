require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "メールアドレスが100文字以内でなければ無効な状態であること" do
    admin = FactoryBot.build(:admin, email: "AaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaAaaaaaaaaaa@email.com")
    admin.valid?
    expect(admin.errors[:email]).to include("は100文字以内で入力してください")
  end
end
