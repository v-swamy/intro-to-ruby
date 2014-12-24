family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

imm_family = family.select { |k, v| (k == :sisters) || (k == :brothers)}

names_array = imm_family.values.flatten

p names_array

