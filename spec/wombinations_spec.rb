require "wombinations"

describe "wombinations" do
  it "should combine two words together" do
    expect(combine("word", "combination")).to eq "wombination"
  end

  it "should provide two choices where the vowels between the two words differ" do
    expect(combine("small", "kitchen")).to eq("smatchen", "smitchen")
  end

  it "should cut the words at the first vowels" do
    expect(combine("flatbread", "kebabs")).to eq("flababs", "flebabs")
  end

  it "should ignore the first letter if it starts with a vowel" do
    expect(combine("Italian","stallion")).to eq("Itallion")
  end
end
