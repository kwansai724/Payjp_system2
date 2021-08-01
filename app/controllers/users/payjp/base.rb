class Users::Payjp::Base < Users::Base
  require 'payjp'
  Payjp.api_key = 'sk_test_711856ed0bb56805afed4e46'
end