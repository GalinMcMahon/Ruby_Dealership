class Vehicle
  @@all_vehicles = []

  define_method(:initialize) do |make,model,year|
    @make = make
    @model = model
    @year = year
  end

  define_method(:make) do
    @make
  end

  define_method(:model) do
    @model
  end

  define_method(:year) do
    @year
  end

  define_singleton_method(:all) do
    @@all_vehicles
  end

  define_method(:save) do
    @@all_vehicles.push(self)
  end
end
