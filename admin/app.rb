require 'sinatra/base'

class Admin < Sinatra::Base
  set :root, File.dirname(__FILE__)
  before do
    redirect to('/login') unless env["auth"]
  end
  get '/' do
    @title = "Admin Interface"
    slim :index
  end
  post '/' do
    redirect to('/')
  end
  get '/user' do
    @title = "Create User"
    slim :user
  end
  post '/user' do
    p = User.new
    p.email = params[:email]
    p.password = params[:password] if params[:password] == params[:password2]
    p.save
    redirect to('/')
  end
  get '/post' do
    @title = "Create Post"
    slim :new
  end
  post '/post' do
    p = Post.new
    p.title      = params[:title]
    p.body       = params[:body]
    p.created_at = Time.now
    p.user = env["auth"]
    p.save
    redirect(to('/'))
  end
end
