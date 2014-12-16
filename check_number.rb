def eval_number()

puts "Pick a number between 0 and 100"
number = gets.chomp.to_i

answer = case 
when number > 0 && number <= 50
	"it is between 0 and 50"
when number > 50 && number <= 100
	"it is between 50 and 100"
else
	"it is over 100"
end

puts answer

end

eval_number()

