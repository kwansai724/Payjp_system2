class Admins::Base < ApplicationController
  before_action :authenticate_admin!
  require 'payjp'
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
end