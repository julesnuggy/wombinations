# wombinations

This is a simple program which combines two words together into a single one; e.g. word + combinations = wombinations. It is based on the absurd behaviour that my boyfriend and I constantly engage in, driving friends and family crazy with the ridiculous (and hilarious) wombinations we come up with.

The program cannot perfectly replicate what it is we do but I have tried to set the algorithm to mimick it as closely as possible. Generally, we split the words at the first vowel and smoosh them together. The difficulty with replicating it in a program is where the first vowels are different between the words, resulting in two possible outputs. In reality, it just depends on which sounds funnier and flows better but I've yet to work out the algorithm to perfectly replicate this. So, instead, it outputs both possibilities in such a case.

There are two methods, for which the wombinations.rb file is sufficiently commented to explain what they are doing.

### processor(str, num)
This method is run to split the input string _str_ at the correct locations, depending on whether it is the first word or second word, and whether or not the two first-vowels are the same letter. In summary it will:
- Split the input string (str)
- Find the index location of the first vowel (ignoring the first letter if the word begins with a vowel)
- Work out the two possible combinations for the word (depending on if we are using word 1's vowel or word 2's)
- Join the letters together and return an array of the two possibilities

The _num_ argument is used to indicate whether _str_ is word 1 or word 2.

### combine(str1, str2)
This method runs the processor method using its two arguments for the first (_str1_) and second words (_str2_). In summary, it will:
- Run processor for word 1, and push the returned array to the output array
- Do the same for word 2
- This gives us a multi-dimensional array
- Join the two options together 
- If the two resulting wombinations are the same, it will _puts_ the string
- If the two resulting wombinations are different, it will _puts_ the array

### input_request
This is the user interface where they will enter the first and second words (via _gets_) and see the resulting wombination(s).
