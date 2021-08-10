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
    expect(enigma.character_set).to be_an(Array)
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
               date: "100821"
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
    expect(enigma.downcase_message_and_split(message)).to be_an(Array)
  end

  it "can set shifts to negative values" do
    enigma = Enigma.new

    array = [2, 13, 9, 73]
    expected = [-2, -13, -9, -73]

    expect(enigma.set_array_shift_values_negative(array)).to eq(expected)
    expect(enigma.set_array_shift_values_negative(array)).to be_an(Array)
  end

  it "can decrypt a message" do
    enigma = Enigma.new
    key = "02715"
    date = "040895"
    ciphertext = "keder ohulw"
    characters = ciphertext.downcase.split("")
    key_manager = KeyManager.new(key)
    offset_manager = OffsetManager.new(date)
    shift_manager = Shift.new(key_manager, offset_manager)
    array_of_shifts = shift_manager.shift

    expect(array_of_shifts).to be_an(Array)

    array_of_negative_shifts = array_of_shifts.map do |shift|
      -(shift)
    end

    array_of_shifts_index_tracker = 0
    encrypted_message = characters.map do |character|
      if array_of_shifts_index_tracker > 3
        array_of_shifts_index_tracker = 0
      end
    new_character = shift_manager.shift_character(character, array_of_negative_shifts[array_of_shifts_index_tracker], enigma.character_set)
    array_of_shifts_index_tracker += 1
    new_character

    expect(new_character).to be_a(String)
    end

    result = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
              }

    # Takes in message, key, and date
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(result)
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to be_a(Hash)
    expect(enigma.create_managers("02715", "040895")).to be_a(Shift)
  end
end
