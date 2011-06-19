require 'sinatra/base'
class LoginManager < Sinatra:: Base
  set :root, File.dirname(__FILE__)
  def do_login
    if session["email"] && session["pass"]
      env["auth"] = User.authenticate(session["email"],session[:pass])
    end
    pass
  end
  get '/*' do do_login end
  post '/*' do do_login end
  put '/*' do do_login end
  delete '/*' do do_login end
  get '/login' do
    slim :login
  end
  post '/login' do
    session[:email] = params[:email]
    session[:pass] = params[:pass]
    if User.authenticate(session[:email],session[:pass]) 
      redirect to('/') 
    else
      redirect to('/login')
    end
  end
  get '/logout' do 
    slim :logout
  end
  post '/logout' do
    session[:email] = nil
    session[:pass] = nil
    redirect to('/')
  end
end
