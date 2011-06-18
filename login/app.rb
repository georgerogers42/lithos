require 'sinatra/base'
class LoginManager < Sinatra:: Base
  enable :sessions
  set :root, File.dirname(__FILE__)
  get '' do 
    slim :login
  end
  post '' do
    env['warden'].authenticate!
    redirect '/admin'
  end
  post '/unauthenticated' do
    slim :login
  end
end
