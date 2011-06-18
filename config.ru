require 'rubygems'
require 'warden'
require 'lithomodel/model'
require 'lithotheme/app'
require 'admin/app'
require 'haml'
map '/admin/' do
  use LoginManager
  run Admin
end
map '/' do
  run Lithos2
end
