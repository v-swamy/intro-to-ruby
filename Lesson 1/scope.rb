# x=4

# loop do
#   x = 'hey there'
#   break
# end

# puts x  # => what’s x?

# a = 5

# 3.times do |n|
#   a = 3
#   b = 5      # b is initialized in the inner scope
# end

# puts a
# puts b       # is b accessible here, in the outer scope?


# def no_mutate(arr)
#   arr.uniq
# end

# my_arr = [1, 2, 2, 3]
# no_mutate(my_arr)
# puts my_arr # => what’s the output?

# loop do
#   loop do
#     x = 8
#     y = 7
#     break
#   end
#   puts y
#   puts x
#   break
# end

x = "hi"

def my_method(n)
  n = 5
  puts n
end

my_method(x)
puts x

