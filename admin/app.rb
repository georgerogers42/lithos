require 'sinatra/base'

class Admin < Sinatra::Base
  set :root, File.dirname(__FILE__)
  before do
    redirect to('/login') unless env["auth"]
  end
  get '/' do
    slim :index
  end
  post '/' do
    redirect to('/')
  end
  get '/user' do
    slim :user
  end
  post '/user' do
    p = User.new
    p.email = params[:email]
    p.password = params[:password]
    p.save
    redirect to('/')
  end
  get '/post' do
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
