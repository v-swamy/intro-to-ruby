pets = ["Sydney", "Stella", "Eli", "Lily"]

pets.each_with_index do |name, i|
	puts "#{i+1}. #{name}"
end