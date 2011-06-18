require 'rubygems'
require 'warden'
require 'lithomodel/model'
require 'lithotheme/app'
require 'admin/app'
require 'haml'
map '/admin/' do
  a = Rack::Auth::Basic.new(Admin) do |user,pass|
    User.authenticate(user,pass)
  end
  run a
end
map '/' do
  run Lithos2
end
