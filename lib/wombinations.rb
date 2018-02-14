#!usr/bin/env ruby

######################
## GLOBAL VARIABLES ##
######################

# Index locations used to determine if the vowel at this index should be
# ignored or not. So, at index 0 (i.e. a word begins with a vowel) the
# program will not try to slice at this index to form a wombination
$idx1 = $idx2 = 0

# Used to count how many vowels there are in the given words so that we
# know how many times to iterate the pombinations method
$vowel_count1 = $vowel_count2 = 0

# Array used in pombinations method to store each wombination that is
# puts'd and is referenced to prevent repeat outputs
$pom_output = []

####################
## DEFINE METHODS ##
####################

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

  # In arr, locate index location of first vowel after the indicated index
  # Include vow == nil condition for cases where arr[i] does not match regexp
  for i in 0..arr.length
    if num == 1
      vow = i if arr[i] =~ /[aeiouy]/ && i != idx1 && vow == nil
    else
      vow = i if arr[i] =~ /[aeiouy]/ && i != idx2 && vow == nil
    end
  end

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
    wombination1

  # otherwise return both as an array
  else
    [wombination1, wombination2]

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
  puts "-"*combine(@input1, @input2).length
  puts combine(@input1, @input2)

  # After combine has been run, give user the option to see all possible
  # combinations. The pombinations method will output a single-dimensional
  # array, $pom_outputs, which is puts'd in this method. pombinations is
  # run iteratively based on the number of vowels contained in each input word.
  # This works by slicing each word at the next available vowel instead of,
  # as per the initial run, just the first vowel locations for both words.
  puts "\nDo you want to see all pombinations (possible combinations)? [Y/N]"
  yes_no = gets.chomp

  if yes_no.upcase == "Y"
    for i in 0..$vowel_count1
      for j in 0..$vowel_count2
        pombinations(i, j)
      end
    end

  # Insert hyphen break based on longest word in $pom_output
  # Check el2 length if the result is an Array; el1 length if a String
  longest = 0
  $pom_output.each { |el1, el2|
    if el1.is_a? Array
      longest = el2.length if el2.length > longest
    else
      longest = el1.length if el1.length > longest
    end
  }

  puts "-"*longest
  puts $pom_output

  else
    puts "\nFINE! BYE!\n"
  end
end

# Method to show all possible combinations based upon the rule that the words
# are split at the vowels.
def pombinations(idx1, idx2, str1 = @input1, str2 = @input2)
  pom = combine(str1, str2, idx1, idx2)
  $pom_output.push(pom) if $pom_output.include?(pom) == false
end

#####################################
##### FOR TESTING PURPOSES ONLY #####
#####################################
# Method which is run in rspec to test that pombinations outputs do not repeat
def pombinations_test(vc1, vc2, str1 = @input1, str2 = @input2)
  for i in 0..vc1
    for j in 0..vc2
      pombinations(i, j, str1, str2)
    end
  end
  puts $pom_output
end

#############################
## FOR RUNNING IN TERMINAL ##
#############################

input_request
