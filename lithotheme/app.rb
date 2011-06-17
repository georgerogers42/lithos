require 'sinatra/base'
class Lithos2 < Sinatra::Base
  set :root, File.dirname(__FILE__)
  get '/' do
    haml :foo
  end
  get '/:id' do
    haml :foo
  end
end
