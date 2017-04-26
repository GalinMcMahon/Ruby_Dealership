require('rspec')
require('./lib/vehicle') #requires lib file that is .rb


describe(Vehicle) do

  describe("#make") do
    it("returns the vehicles make") do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      expect(test_vehicle.make()).to(eq("TOYOTA"))
    end
  end

  describe("#model") do
    it("returns the vehicles model") do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      expect(test_vehicle.model()).to(eq("4RUNNER"))
    end
  end

  describe("#year") do
    it("returns the vehicles year") do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      expect(test_vehicle.year()).to(eq(2000))
    end
  end

  describe(".all") do
    it("starts out as empty") do
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the vehicle to the vehicle array") do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000").save()
      expect(Vehicle.all()).to(eq(test_vehicle))
    end
  end

  describe(".clear") do
    it("clears out the all vehicles array") do
    test_vehicle = Vehicle.new("Toyota", "4Runner", "2000").save()
    Vehicle.clear()
    expect(Vehicle.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("automatically creates an id for each new instance of a vehicle") do
    test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
    test_vehicle.save()
    expect(test_vehicle.id()).to(eq(1))
    end
  end

  describe("#age") do
    it("returns the vehicles age") do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      expect(test_vehicle.age()).to(eq(17))
    end
  end

  describe("#worth_buying?") do
    it("returns false if the vehicle is not American made and less than 17 years old") do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      expect(test_vehicle.worth_buying?()).to(eq(false))
    end
  end

  describe('.find') do
    it('returns a specific vehicle based on its id number') do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      test_vehicle.save()
      test_vehicle2 = Vehicle.new("Subaru", "Crosstrek", "2016")
      test_vehicle2.save()
      expect(Vehicle.find(test_vehicle.id())).to(eq(test_vehicle))
    end
  end
end
