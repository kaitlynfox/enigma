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

  it "can encrypt a message with a provided key and date" do
    enigma = Enigma.new

    result =
            {
               encryption: "keder ohulw",
               key: "02715",
               date: "040895"
             }

    message = "hello world"

    expect(enigma.downcase_message(message)).to eq("hello world")
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(result)
    expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
  end

  it "can encrypt a message with a provided key" do
    enigma = Enigma.new

    result =
            {
               encryption: "nefau qdxly",
               key: "02715",
               date: "090821"
             }

    message = "hello world"

    expect(enigma.downcase_message(message)).to eq("hello world")
    expect(enigma.encrypt("hello world", "02715")).to eq(result)
  end

  it "can create managers needed for encryption" do
    enigma = Enigma.new

    key = "02715"
    date = "090821"

    expect(enigma.create_managers(key, date)).to be_a(Shift)
  end

  it "can downcase and split a message" do
    enigma = Enigma.new

    message = "HELLO WORLD"
    expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

    expect(enigma.downcase_message_and_split(message)).to eq(expected)
  end

  it "can set shifts to negative values" do
    enigma = Enigma.new

    array = [2, 13, 9, 73]
    expected = [-2, -13, -9, -73]

    expect(enigma.set_array_shift_values_negative(array)).to eq(expected)
  end

  it "can decrypt a message" do
    enigma = Enigma.new

    result = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
              }

    # Takes in message, key, and date
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(result)
  end
end
