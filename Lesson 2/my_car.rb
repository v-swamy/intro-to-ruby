module Loadable
  def load_tons(num)
    puts "You have loaded #{num} tons of stuff."
  end
end

class Vehicle
  attr_accessor :color, :model
  attr_reader :year
  @@num_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@num_of_vehicles += 1
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  def self.num_of_vehicles
    puts "You have created #{@@num_of_vehicles} vehicles."
  end

  def self.gas_mileage(gallons, miles)
    puts "This car gets #{miles / gallons} MPG."
  end

  def speed_up(speed_increase)
    @current_speed += speed_increase
    puts "You accelerate #{speed_increase} mph."
  end

  def brake(speed_decrease)
    @current_speed -= speed_decrease
    puts "You decelerate #{speed_decrease} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def off
    @current_speed = 0
    puts "You have stopped."
  end

  private

  def years_old
    Time.now.year - self.year.to_i
  end

end

class MyCar < Vehicle
  ENGINE_TYPE = 'V6'

  def spray_paint(new_color)
    self.color = new_color
    puts "Your car has been painted #{new_color}"
  end

  def to_s
    "Your car is a #{self.year} #{self.model} in #{self.color}."
  end
end

class MyTruck < Vehicle
  include Loadable
  ENGINE_TYPE = 'Diesel'
end




audi = MyCar.new('2012', 'black', 'A6')
audi.speed_up(20)
audi.current_speed
audi.brake(5)
audi.current_speed
audi.off
audi.current_speed
puts audi.year
puts audi.color
audi.spray_paint('silver')
puts audi.color
puts audi
Vehicle.num_of_vehicles
ford = MyTruck.new('2014', 'red', 'F150')
ford.load_tons(4)
puts "Your truck is a #{ford.year} #{ford.color} #{ford.model}."
puts ford.age
puts audi.age
# puts Vehicle.ancestors
# puts MyTruck.ancestors
# puts MyCar.ancestors


