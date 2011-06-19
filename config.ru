require 'rubygems'
LOAD_PATH << "."
require 'lithomodel/model'
require 'login/app'
require 'lithotheme/app'
require 'admin/app'
use Rack::Session::Cookie
map '/admin/' do
  use LoginManager
  run Admin
end
map '/' do
  run Lithos2
end
