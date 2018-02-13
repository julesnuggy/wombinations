require "wombinations"

describe "wombinations" do
  it "should combine two words together" do
    expect { combine("word", "combination") }.to output("wombination\n").to_stdout
  end

  it "should provide two choices where the vowels between the two words differ" do
    expect { combine("small", "kitchen") }.to output("smatchen\nsmitchen\n").to_stdout
  end

  it "should cut the words at the first vowels" do
    expect { combine("flatbread", "kebabs") }.to output("flababs\nflebabs\n").to_stdout
  end

  it "should ignore the first letter if it starts with a vowel" do
    expect { combine("Italian","stallion") }.to output("Itallion\n").to_stdout
  end

end
