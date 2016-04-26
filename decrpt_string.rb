
# Here’s a simple strategy to encode a message: before each letter of the message, add a number and series of letters. The number should correspond to the number of letters that will precede the message's actual, meaningful letter.

# skip 0, find the ‘h’
# skip 2 (‘a’ and ‘b’), find ‘e’
# skip 1 (‘z’), find ‘y’

# Write a function called “decode”, which takes a string in this code format and returns the decoded word. You may assume that coded strings are always legally encoded with this system.


def decode(string) 
	decoded_string = [] 
	string = string.split("") 
	range_from_zero_to_nine = [*("0".."9")] 

	string.map! do |character| 
		if range_from_zero_to_nine.include?(character) 
			character.to_i 
		else 
			character 
		end 
	end 

	string.each_with_index do |character, index| 
		if character.is_a? Integer 
			character += 1 
			index += character 
			decoded_string << string[index] 
		end 
	end p decoded_string.join 
end

decode("0h2abe1zy”)