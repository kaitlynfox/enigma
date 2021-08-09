require './lib/enigma'

RSpec.describe Enigma do
  it "exists" do
    enigma = Enigma.new

    expect(enigma).to be_an(Enigma)
  end

  it "can have a character set of defined characters" do
    enigma = Enigma.new

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    expect(enigma.character_set).to eq(expected)
  end

  xit "can encrypt a message with a key and date" do
    enigma = Enigma.new

    result =
            {
               encryption: "keder ohulw",
               key: "02715",
               date: "040895"
             }

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(result)
  end
end
