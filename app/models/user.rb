class User < ActiveRecord::Base
  include Stormpath::Rails::User
  
  store_accessor :configs

end
