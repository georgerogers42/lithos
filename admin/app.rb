require 'sinatra_warden/sinatra'
require 'sinatra/base'

class Admin < Sinatra::Base
  enable :sessions
  set :root, File.dirname(__FILE__)
  get '/' do
    slim :index
  end
  post '/' do
    redirect to('/')
  end
  get '/user' do
    slim :login
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
    p.save!
    redirect(to('/'))
  end
end
