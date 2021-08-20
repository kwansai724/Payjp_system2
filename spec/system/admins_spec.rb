require 'rails_helper'

RSpec.describe "Admins", type: :system do
  it "管理者としてログインする" do
    admin = FactoryBot.create(:admin)
    user = FactoryBot.create(:user)

    visit root_path
    click_link "管理者の方はこちら"
    fill_in "Eメール", with: admin.email
    fill_in "パスワード", with: admin.password
    click_button "ログイン"

    # visit "index"
    # click_link "顧客一覧へ"

    # visit "user_index"
    # expect {
    #   expect(page).to have_selector "#{user.name}"
    #   expect(page).to have_selector "#{user.email}"
    #   expect(page).to have_selector "#{Plan.find(Subscription.find_by(user_id: user.id).plan_id).name}"
    # }
    # click_link "詳細"
    # save_and_open_page

    # visit "user_show"
    # expect {
    #   expect(page).to have_selector "名前:"
    #   expect(page).to have_selector "Eメール:"
    #   expect(page).to have_selector "性別:"
    #   expect(page).to have_selector "生年月日::"
    #   expect(page).to have_selector "住所:"
    #   expect(page).to have_selector "プラン:"
    # }
  end
end
