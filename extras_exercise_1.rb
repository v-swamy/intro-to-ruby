def check(word)
	if word =~ /lab/
		puts word
	end
end

strings = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

strings.each {|word| check(word)}

