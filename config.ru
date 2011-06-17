require 'lithotheme/app'
require 'admin/app'
map '/admin' do
  run Admin
end
map '/' do
  run Lithos2
end
