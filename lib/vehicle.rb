class Vehicle
  @@vehicles = []

  define_method(:initialize) do |make,model,year|
    @make = make.upcase()
    @model = model.upcase()
    @year = year.upcase()
    @id = @@vehicles.length().+(1)
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
    @@vehicles
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end

  define_method(:id) do
    @id
  end

  define_method(:age) do
    current_year = Time.new().year()
    @age = current_year - @year.to_i
  end

  define_method(:worth_buying?) do
    american_cars = ["Chrysler", "Ford", "GM"]
    american_cars.include?(@make).&(self.age().<=(17))
  end

  define_singleton_method(:find) do |identification|
    found_vehicle = nil
    @@vehicles.each() do |vehicle|
      if  vehicle.id() == identification
       found_vehicle = vehicle
      end
    end
    found_vehicle
  end
end
