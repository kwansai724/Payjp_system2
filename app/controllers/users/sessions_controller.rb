# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # ユーザーログイン後の画面遷移
  def after_sign_in_path_for(resource)
    if current_user.customer_id && Subscription.find_by(user_id: current_user.id).present?
      users_cards_path
    else
      users_plans_choice_path(resource)
    end
  end

  # ユーザーログアウト後の画面遷移
  def after_sign_out_path_for(resource)
    root_path
  end
  

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
