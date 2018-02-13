#!usr/bin/env ruby

# Repeatable method to process the input strings
# str is the input string, num indicates whether it is first or second word
def processor(str, num)
  # Split arguments into arrays of individual letters
  arr = str.split("")

  # For each arr, locate index location of first vowel after the first letter
  vow = arr.find_index { |let|
    let =~ /[aeiouy]/ if arr.index != 0
  }

  # Cut letters from array to create wom1 and wom2
  # Only return both if they are different (which will be whenever the
  # first vowels are different between the two words)

  # If first word...
  if num == 1
    # Option 1: begin from index 0 and length is vow + 1 if using word 1 vowel
    # Option 2: begin from index 0 and length is vow if using word 2 vowel
    wom1 = arr.slice(0, vow + 1)
    wom2 = arr.slice(0, vow)

  # If second word...
  else
    # Option 1: begin from index vow + 1 if using word 1 vowel
    # Option 2: begin from index vow if using word 2 vowel
    # To ensure length is enough to get to last letter, use arr.length
    wom1 = arr.slice(vow + 1, arr.length)
    wom2 = arr.slice(vow, arr.length)

  end

  # Return array of wom1 and wom2 joined up into strings
  res = [wom1.join(""), wom2.join("")]
end

# Method to combine two string arguments togehter into a single string
def combine(str1, str2)
  # Create an array which we will read the final outputs from
  output = []

  # Run processor for word 1 and push result to output
  output.push(processor(str1, 1))

  # Run processor for word 2 and push result to output
  output.push(processor(str2, 2))

  # Join the partial words together to form the wombinations
  wombination1 = (output[0][0] + output [1][0])
  wombination2 = (output[0][1] + output [1][1])

  # If the words are the same, then just return one of them...
  if wombination1 == wombination2
    puts wombination1

  # otherwise return both as an array
  else
    puts [wombination1, wombination2]

  end
end

input1 = gets.chomp
input2 = gets.chomp
combine(input1, input2)
