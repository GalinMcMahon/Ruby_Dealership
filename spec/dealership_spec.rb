require('rspec')
require('dealerships') #requires lib file that is .rb
require('vehicle')

describe(Dealership) do
  describe("#name") do
    it("accepts a new dealerships name") do #doesnt matter english explination
      test_dealership = Dealership.new("Bob's Dealership")
      expect(test_dealership.name()).to(eq("Bob's Dealership"))
    end
  end

  describe(".all") do
    it("display all of the dealerships in the @@dealerships array") do #doesnt matter english explination
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns a specific dealership based on its id number") do
      test_dealership = Dealership.new("Bob's Dealership")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("saves the dealership id to the dealerships array") do
      test_dealership = Dealership.new("Bob's Dealership").save()
      expect(Dealership.all()).to(eq(test_dealership))
    end
  end

  describe(".clear") do
    it("clears out all the saved dealerships") do
      test_dealership = Dealership.new("Bob's Dealership")
      test_dealership.save()
      expect(Dealership.clear()).to(eq([]))
    end
  end

  describe(".find") do
    it("finds a dealership by its id number") do
      test_dealership = Dealership.new("Bob's Dealership")
      test_dealership.save()
      test_dealership2 = Dealership.new("John's Dealership")
      test_dealership2.save()
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end

  describe('#add_vehicle') do
    it('adds a vehicle to the cars array') do
      test_dealership = Dealership.new("Bob's Dealership")
      test_vehicle = Vehicle.new("Toyota", "4Runner", "2000")
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
      end
    end

end
