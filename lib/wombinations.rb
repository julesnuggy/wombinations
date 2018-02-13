#!usr/bin/env ruby

$vowel_count1 = $vowel_count2 = 0
$idx1 = $idx2 = 0

# Repeatable method to process the input strings
# str is the input string, num indicates whether it is first or second word
def processor(str, num, idx1, idx2)
  # Split arguments into arrays of individual letters
  arr = str.split("")

  # Count how many vowels there are in the words
  if num == 1
    $vowel_count1 = arr.count { |lett|
      lett =~ /[aeiouy]/
    } - 1
  else
    $vowel_count2 = arr.count { |lett|
      lett =~ /[aeiouy]/
    } - 1
  end

  # In arr, locate index location of first vowel after the first letter

  #vow = arr.find_index { |let|
  #  if num == 1
  #    let =~ /[aeiouy]/ if index(let) != idx1
  #  elsif num == 2
  #    let =~ /[aeiouy]/ if index(let) != idx2
  #  end
  #}
  vow = nil
  for i in 0..arr.length
    if num == 1
      vow = i if arr[i] =~ /[aeiouy]/ && i != idx1 && vow == nil
    else
      vow = i if arr[i] =~ /[aeiouy]/ && i != idx2 && vow == nil
    end
  end

  #puts "\nnum = #{num}"
  #puts "vow = #{vow}"
  #puts "idx1 = #{idx1}"
  #puts "idx2 = #{idx2}"

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

  #puts "wom1 = #{wom1}"
  #puts "wom2 = #{wom2}"
  # Return array of wom1 and wom2 joined up into strings
  res = [wom1.join(""), wom2.join("")]
end

# Method to combine two string arguments togehter into a single string
def combine(str1, str2, idx1 = $idx1, idx2 = $idx2)
  # Create an array which we will read the final outputs from
  output = []

  # Run processor for word 1 and push result to output
  output.push(processor(str1, 1, idx1, idx2))

  # Run processor for word 2 and push result to output
  output.push(processor(str2, 2, idx1, idx2))

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

# Method to ask for user input
def input_request
  puts "\nPlease provide the first word:"
  print ">>"
  @input1 = gets.chomp

  puts "\nPlease provide the second word:"
  print ">>"
  @input2 = gets.chomp

  puts "\nResult:"
  puts "-------"
  combine(@input1, @input2)

  puts "\nDo you want to see all pombinations (possible combinations)? [Y/N]"
  yes_no = gets.chomp

  if yes_no.upcase == "Y"
    for i in 0..$vowel_count1
      for j in 0..$vowel_count2
        try_again(i, j)
      end
    end

  else
    puts "FINE! BYE!"
  end
end

# Method to allow user to run program again with additional options
def try_again(idx1, idx2)

    puts "-"*[@input1.length, @input2.length].max*1.75
    combine(@input1, @input2, idx1, idx2)

end

###################################################
##### NEXT STEP IS TO ELIMINATE REPEAT OUTPUTS ####
###################################################

input_request
