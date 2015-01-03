# module Speak
#   def speak(sound)
#     puts "#{sound}"
#   end
# end

# class GoodDog
#   include Speak
# end

# class HumanBeing
#   include Speak
# end

# sparky = GoodDog.new
# sparky.speak("Arf!")
# bob = HumanBeing.new
# bob.speak("Hello!")

# puts "---GoodDog ancestors---"
# puts GoodDog.ancestors
# puts ""
# puts "---HumanBeing ancestors---"
# puts HumanBeing.ancestors

# class GoodDog
#   attr_accessor :name, :height, :weight, :age
#   @@number_of_dogs = 0
#   DOG_YEARS = 7

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#     @@number_of_dogs += 1
#   end

#   def speak
#     "#{name} says arf!"
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{name} weights #{weight} and is #{height} tall."
#   end

#   def self.what_am_i
#     "I'm a GoodDog class!"
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end

#   def to_s
#     "This dog's name is #{name} and it is #{age * DOG_YEARS} in dog years."
#   end

# end

# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.info

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info

# puts GoodDog.what_am_i
# puts GoodDog.total_number_of_dogs

# sydney = GoodDog.new('Sydney', '30 inches', '69 lbs')
# puts GoodDog.total_number_of_dogs

# sydney.age = 8
# puts sydney

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "Hello!"
  end
end

class GoodDog < Animal

  def intialize(color)
    super
    @color = color
  end
end


  # attr_accessor :name

  # def initialize(n)
  #   self.name = n
  # end

  # def change_info(n, h, w)
  #   self.name = n
  #   self.height = h
  #   self.weight = w
  # end

  # def info
  #   "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  # end

  # def what_is_self
  #   self
  # end

  def speak
    super + " from GoodDog class"
  end

  puts self
  
end

class Cat < Animal
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

bruno = GoodDog.new("brown")





