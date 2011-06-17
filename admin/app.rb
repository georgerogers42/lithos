require 'sinatra/base'
class Admin < Sinatra::Base
  set :root, File.dirname(__FILE__)
  get '/' do
    "Admin's area"
  end
end
