def say(str)
  puts "------ #{str} "
end

def is_number?(input)
  input.to_i.to_s == input || input.to_f.to_s == input
end

say "Welcome to Calculator!"

say "Please enter your first number."
num1 = gets.chomp

while is_number?(num1) == false
  say "Not a number! Please enter your first number."
  num1 = gets.chomp
end

say "Your first number is #{num1}."

say "Please enter your second number."
num2 = gets.chomp

while is_number?(num2) == false
  say "Not a number! Please enter your second number."
  num2 = gets.chomp
end

say "Your second number is #{num2}."

say "Choose your operation:"
say "Press 1 for addition"
say "Press 2 for subtraction"
say "Press 3 for multiplication"
say "Press 4 for division"

operation = gets.chomp

case operation
when "1"
  result = num1.to_f + num2.to_f
  say "Your result is #{result}!"
when "2"
  result = num1.to_f - num2.to_f
  say "Your result is #{result}!"
when "3"
  result = num1.to_f * num2.to_f
  say "Your result is #{result}!"
when "4"
  if num2 == '0'
    say "You can't divide by zero!"
  else
    result = num1.to_f / num2.to_f
    say "Your result is #{result}!"
  end
end





