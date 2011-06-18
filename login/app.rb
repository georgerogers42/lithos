require 'sinatra/base'
class LoginManager < Sinatra:: Base
  enable :sessions
  set :root, File.dirname(__FILE__)
  any '/*' do 
    slim :login
  end
end
