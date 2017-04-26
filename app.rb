require('rspec')
require('./lib/vehicle')
require('./lib/dealerships')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')

get('/') do
  erb(:form)
end

get('/vehicles') do
 @vehicle_make = params.fetch('make').upcase
 @vehicle_
end
