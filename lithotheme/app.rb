require 'sinatra/base'
require 'slim'
class Lithos2 < Sinatra::Base
  helpers do
    def partial(l,t,params={})
      self.send(l, t, params.merge(:layout=>false))
    end
  end
  set :root, File.dirname(__FILE__)
  get '/' do
    @posts = Post.all
    slim :index
  end
  get '/:id' do
    @post = Post.get(params[:id])
    slim :post
  end
end
