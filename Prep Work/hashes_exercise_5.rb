family = {wife: 'Whitney', dog1: 'Sydney', dog2: 'Stella', cat1: 'Eli', cat2: 'Lily'}

def has_value(hash, value)
	if hash.has_value?(value) == true
		puts 'Your hash has the value!'
	else
		puts "Your hash doesn't have the value!"
	end
end

has_value(family, 'Aasha')