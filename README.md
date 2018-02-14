# wombinations

This program combines two words together into a single one; e.g. word + combinations = wombinations. It is based on the absurd behaviour that my boyfriend and I constantly engage in, driving friends and family crazy with the ridiculous (and hilarious) wombinations we come up with.

The program cannot perfectly replicate what it is we do but I have tried to set the algorithm to mimick it as closely as possible. Generally, we split the words at the first vowel and smoosh them together. The difficulty with replicating it in a program is where the first vowels are different between the words, resulting in two possible outputs. In reality, it just depends on which sounds funnier and flows better but I've yet to work out the algorithm to perfectly replicate this. So, instead, it outputs both possibilities in such a case. 

Since beginning this program, I have also realised that there are scenarios where it isn't the first vowel being split which results in the funniest sounding wombination (e.g. perfect + solution = perfolution). But, then again, it's a subjective matter as to what one finds funny. So I've amended the original ("master" branch) program and added another method which outputs all possible combinations (pombinations) in this "test_branch" branch.

The wombinations.rb file is sufficiently commented to explain what the program is doing at each method, but here's a summary of each.

### global variables
Certain variables need to be set globally as they are used between methods.

### processor(str, num, idx1, idx2)
This method is run to split the input string _str_ at the correct locations, depending on whether it is the first word or second word, and whether or not the two first-vowels are the same letter. In summary it will:
- Split the input string (str)
- Find the index location of the first vowel (ignoring the first letter if the word begins with a vowel for the first run)
- Work out the two possible combinations for the word (depending on if we are using word 1's vowel or word 2's)
- Join the letters together and return an array of the two possibilities
- idx1 and idx2 are used if pombinations is called but by default equal 0

The _num_ argument is used to indicate whether _str_ is word 1 or word 2.

### combine(str1, str2, idx1 [opt], idx2 [opt])
This method runs the processor method using its two arguments for the first (_str1_) and second words (_str2_). In summary, it will:
- Run processor for word 1, and push the returned array to the output array
- Do the same for word 2
- This gives us a multi-dimensional array
- Join the two options together 
- If the two resulting wombinations are the same, it will _puts_ the string
- If the two resulting wombinations are different, it will _puts_ the array
- idx1 and idx2 are used if pombinations is called but by default equal 0

### input_request
This is the user interface where they will enter the first and second words (via _gets_) and see the resulting wombination(s). It will run combine to generate the one or two initial possible wombinations. After the first output, it will give the user the option to see all possible combinations.

### pombinations(idx1, idx2, str1 [opt], str2 [opt])
This methods generates all the different possible combinations for the two input strings str1 and str2. By default, these are set to equal the user's input strings in input_request. The only time they will differ is when running rspec. It runs combine and the arguments idx1 and idx2 are changed within the loop contained in input_request. It will only push results which have not already been generated into the global array $pom_output.

### pombinations_test(vc1, vc2, str1 [opt], str2 [opt])
A test method used for rspec only. vc1 and vc2 refer to $vowel_count1 and $vowel_count2, which will need to be specified in the rspec file.
