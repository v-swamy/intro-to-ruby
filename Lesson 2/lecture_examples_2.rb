class Animal
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def eat
    "#{name} is eating."
  end

  def speak
    "#{name} is speaking!"
  end
end

class Dog < Animal
  def fetch
    "#{name} is fetching!"
  end

  def speak
    "#{name} is barking!"
  end
end


class Cat < Animal

end
      


teddy = Dog.new('teddy')
puts teddy.name
puts teddy.eat
puts teddy.fetch
puts teddy.speak

kitty = Cat.new('kitty')
puts kitty.name
puts kitty.eat
puts kitty.speak

