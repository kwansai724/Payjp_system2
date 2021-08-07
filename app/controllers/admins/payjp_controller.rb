class Admins::PayjpController < Admins::Base
  
  def index
  end

  def user_index
    @users = User.all
  end

  def user_show
  end
end
