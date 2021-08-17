class Admins::PayjpController < Admins::Base
  
  def index
  end

  def user_index
    @search_params = user_search_params
    @users = User.search(@search_params).page(params[:page]).per(10)
  end

  def user_show
    if Subscription.find_by(user_id: params[:user_id]).present?
      @user = Payjp::Customer.retrieve(params[:format])
      @subscription = Subscription.find_by(user_id: params[:user_id])
      @plan = Plan.find(@subscription.plan_id)
   else
      @user = User.find(params[:user_id])
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    if Subscription.find_by(user_id: params[:user_id]).present?
      customer = Payjp::Customer.retrieve(@user.customer_id)
      customer.delete
      @user.destroy
      flash[:success] = "「#{@user.name}」さんのデータを削除しました。"
      redirect_to admins_user_index_url
    else
      @user.destroy
      flash[:success] = "「#{@user.name}」さんのデータを削除しました。"
      redirect_to admins_user_index_url
    end
  end

  private

  def user_search_params
    params.fetch(:search, {}).permit(:name)
  end
end
