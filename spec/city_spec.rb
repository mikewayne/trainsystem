require "spec_helper"


describe(City) do
  describe("#==") do
    it("returns true for objects that have same name and id") do
      city1 = City.new({:name => 'Portland', :id => nil})
      city2 = City.new({:name => 'Portland', :id => nil})
      expect(city1.==(city2)).to(eq(true))
    end
  end

  describe("#save") do
    it("add the city to the cities table") do
      city1 = City.new({:name => 'Portland', :id => nil})
      city1.save()
      expect(City.all()).to(eq([city1]))
    end
  end

  describe(".find") do
    it("returns a city with the given id") do
      city1 = City.new({:name => 'Portland', :id => nil})
      city1.save()
      expect(City.find(city1.id)).to(eq(city1))
    end
  end

  describe("#delete") do
    it("deletes a city from the cities table") do
      city1 = City.new({:name => 'blue', :id => nil})
      city1.save()
      city2 = City.new({:name => 'red', :id => nil})
      city2.save()
      city1.delete()
      expect(City.all()).to(eq([city2]))
    end
  end

end
