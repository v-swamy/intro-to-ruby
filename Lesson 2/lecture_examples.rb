class Dog

  attr_accessor :name, :height, :weight

  @@count = 0

  def self.total_dogs
    "Total number of dogs: #{@@count}"
  end

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
    @@count += 1
  end

  def speak       #instance method, shared across objects
    @name + "barks!"
  end

  def info
    "#{name} is #{height} tall and weighs #{weight} pounds."
  end

  def update_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
end

teddy = Dog.new('teddy', 3, 95)
fido = Dog.new('fido', 1, 35)

puts teddy.info
teddy.update_info('Roosevelt', 5, 125)
puts teddy.info





