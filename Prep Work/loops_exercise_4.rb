def countdown(number)
	puts number
	if number <= 0
		puts "All done!"
	else
		countdown(number - 1)
	end
end

countdown(10)