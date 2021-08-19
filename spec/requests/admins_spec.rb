require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "管理者でログインできること" do
    context "正常系" do
      before do
        admin = FactoryBot.create(:admin)
        sign_in admin
        get admins_index_path
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end
  end
end
