# Given the following array:
nested_animals = [[:dog, :cat, :zebra], [:quokka, :unicorn, :bear]]

# Use an enumerable to:
# 1. Return an unnested (single layer) array of animals as strings

# look at every element of nested_animals array (animals)
  #look at every element of animals (animal)
    #change each animal into a string

# return single array of manipulated 'animal' objects
string_animals = []

nested_animals.each do |animals|
  animals.each do |animal|
    string_animals << animal.to_s
  end
end

p string_animals

# 2. Return an unnested array of animals with length >= 4

string_animals = []

nested_animals.each do |animals|
  animals.each do |animal|
    string_animals << animal if animal.length >= 4
  end
end

p string_animals


# 3. Return a hash where the keys are the animal, and the values are the length. ex: {dog: 3, cat: 3, zebra: 5 ... }

string_animals = {}

nested_animals.each do |animals|
  animals.each do |animal|
    string_animals[animal] = animal.length
  end
end

p string_animals