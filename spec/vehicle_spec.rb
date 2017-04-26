require('rspec')
require('./lib/vehicle') #requires lib file that is .rb

describe(Vehicle) do

  describe("#make") do
    it("returns the vehicles make") do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      expect(test_vehicle.make()).to(eq("Toyota"))
    end
  end

  describe("#model") do
    it("returns the vehicles model") do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      expect(test_vehicle.model()).to(eq("4Runner"))
    end
  end

  describe("#year") do
    it("returns the vehicles year") do
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      expect(test_vehicle.year()).to(eq("2000"))
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

end
