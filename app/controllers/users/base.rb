class Users::Base < ApplicationController
  before_action :authenticate_user!
  # layout 'users'

  def paid_user?
    unless current_user.subscription
      flash[:notice] = "プラン登録をしましょう！"
      redirect_to users_plans_choice_url
    end
  end
end