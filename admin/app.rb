require 'sinatra/base'
class Admin < Sinatra::Base
  set :root, File.dirname(__FILE__)
  get '/' do
    haml :index
  end
  get '/post' do
    haml :new
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
