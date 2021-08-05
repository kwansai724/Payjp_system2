class UseController < ApplicationController

  def index
    @users = User.all
  end
end