class Admins::Base < ApplicationController
  before_action :authenticate_admin!
  require 'payjp'

end