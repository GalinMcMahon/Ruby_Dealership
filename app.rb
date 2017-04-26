require('rspec')
require('./lib/vehicle')
require('./lib/dealerships')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/vehicles') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get('/vehicles/new') do
  erb(:vehicles_form)
end

get('/dealerships/new') do # URL
  erb(:dealerships_form)   # displayed at the URL - the erb page
end

get('/dealerships') do
  @all_dealerships = Dealership.all()
  erb(:dealerships)
end


post('/dealerships') do
  name = params.fetch('name')
  Dealership.new(name).save()
  @all_dealerships = Dealership.all()
  erb(:success)
end

get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch('id'))
  erb(:vehicle)
end

get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id'))
  erb(:success)
end

get('/dealerships/:id/vehicles/new') do
  @dealership = Dealership.find(params.fetch('id'))
  erb(:dealership_vehicles_form)
end

post('/vehicles') do
 vehicle_make = params.fetch('make')
 vehicle_model = params.fetch('model')
 vehicle_year = params.fetch('year')
 @vehicle = Vehicle.new(vehicle_make,vehicle_model,vehicle_year)
 @vehicle.save()
 @dealership = Dealership.find(params.fetch('dealership_id').to_i())
 @dealership.add_vehicle(@vehicle)
 erb(:success)
end
