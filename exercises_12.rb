contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# joe_array = contact_data[0]
# sally_array = contact_data[1]

# joe_hash = {email: joe_array[0], address: joe_array[1], phone: joe_array[2]}
# sally_hash = {email: sally_array[0], address: sally_array[1], phone: sally_array[2]}

# contacts["Joe Smith"] = joe_hash
# contacts["Sally Johnson"] = sally_hash

# p contacts

# contacts["Joe Smith"][:email] = contact_data[0][0]
# contacts["Joe Smith"][:address] = contact_data[0][1]
# contacts["Joe Smith"][:phone] = contact_data[0][2]
# contacts["Sally Johnson"][:email] = contact_data[1][0]
# contacts["Sally Johnson"][:address] = contact_data[1][1]
# contacts["Sally Johnson"][:phone] = contact_data[1][2]

# p contacts["Joe Smith"][:email]
# p contacts["Sally Johnson"][:phone]


keys = [:email, :address, :phone]

contacts.each do |key, value|
	keys.each do |i|
		contacts[key][i] = contact_data.first.shift
	end
	contact_data.shift
end

p contacts

