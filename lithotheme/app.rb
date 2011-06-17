require 'sinatra/base'
class Lithos2 < Sinatra::Base
  set :root, File.dirname(__FILE__)
  get '/' do
    @posts = Post.all
    haml :index
  end
  get '/:id' do
    haml :post
  end
end
