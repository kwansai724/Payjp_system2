require 'rails_helper'

RSpec.describe Admins::PayjpController, type: :controller do
  describe "#index" do
    context "認証済みのユーザーとして" do
      before do
        @admin = FactoryBot.create(:admin)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @admin
        get :index
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        sign_in @admin
        get :index
        expect(response).to have_http_status "200"
      end
    end

    context "ゲストとして" do
      it "302レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトすること" do
        get :index
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end

  describe "#user_index" do
    context "認証済みのユーザーとして" do
      before do
        @admin = FactoryBot.create(:admin)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @admin
        get :user_index
        expect(response).to be_success
      end
    end

    context "認可されていないユーザーとして" do
      it "管理者ログイン画面にリダイレクトすること" do
        get :user_index
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end

  describe "#user_show" do
    context "認証済みのユーザーとして" do
      before do
        @admin = FactoryBot.create(:admin)
        @user = FactoryBot.create(:user)
      end
      it "正常にレスポンスを返すこと" do
        sign_in @admin
        get :user_show, params: { user_id: @user.id }
        expect(response).to be_success
      end
    end

    context "認可されていないユーザーとして" do
      it "管理者ログイン画面にリダイレクトすること" do
        get :user_show
        expect(response).to redirect_to "/admins/sign_in"
      end
    end  
  end

  describe "#destroy" do
    context "認証済みのユーザーとして" do
      before do
        @admin = FactoryBot.create(:admin)
        @user = FactoryBot.create(:user)
      end
      it "ユーザーを削除できること" do
        sign_in @admin
        expect { delete :destroy, params: { user_id: @user.id } }
      end
    end

    context "認可されていないユーザーとして" do
      it "管理者ログイン画面にリダイレクトすること" do
        delete :destroy
        expect(response).to redirect_to "/admins/sign_in"
      end
    end 
  end

end
