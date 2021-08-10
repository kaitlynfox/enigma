require './lib/shift'
require './lib/key_manager'
require './lib/offset_manager'
require './lib/enigma'

RSpec.describe Shift do
  it "exists" do
    # Create an instance of KeyManager to get the keys to pass into Shift
    # Create an instance of OffsetManager to get the keys to pass into Shift
    key_manager = KeyManager.new
    offsets_manager = OffsetManager.new
    shift_1 = Shift.new(key_manager, offsets_manager)

    expect(shift_1).to be_a(Shift)
    expect(shift_1.keys).to be_a(Hash)
    expect(shift_1.offsets).to be_a(Hash)
  end

  it "can add keys and offsets together to create individual shifts" do
    # Create an instance of KeyManager to get the keys to pass into Shift
    # Create an instance of OffsetManager to get the keys to pass into Shift
    key_manager = KeyManager.new
    offsets_manager = OffsetManager.new
    shift_1 = Shift.new(key_manager, offsets_manager)

    expect(shift_1.shift).to be_an(Array)
    expect(shift_1.shift.size).to eq(4)
    shift_1.shift.each do |shift|
      expect(shift).to be_an(Integer)
    end
  end

    it "can shift a character" do
      # Create an instance of KeyManager to get the keys to pass into Shift
      # Create an instance of OffsetManager to get the keys to pass into Shift
      key_manager = KeyManager.new
      offsets_manager = OffsetManager.new
      shift_1 = Shift.new(key_manager, offsets_manager)

      # Create an enigma to access character_set
      enigma = Enigma.new
      # Access the character_set
      character_set = enigma.character_set

      character = "x"
      shift = 100
      expected = "p"

      expect(shift_1.shift_character(character, shift, character_set)).to be_an(String)
      expect(shift_1.shift_character(character, shift, character_set)).to eq(expected)
      expect(shift_1.adjust_shift_value(shift)).to eq(19)

      character = "x"
      shift = 8
      expected = "e"

      expect(shift_1.adjust_shift_value(shift)).to eq(8)

      character = "%"
      shift = 8
      expected = "e"

      expect(shift_1.shift_character(character, shift, character_set)).to eq("%")

      character = "!"
      shift = 8
      expected = "e"

      expect(shift_1.shift_character(character, shift, character_set)).to eq("!")

      shift_1.shift_character(character, shift, character_set = enigma.character_set)
      starting_point = character_set.index(character)

      expect(starting_point.nil?).to eq(true)

      character = "h"
      shift = 8

      shift_1.shift_character(character, shift, character_set = enigma.character_set)
      starting_point = character_set.index(character)

      expect(starting_point.nil?).to eq(false)
    end

    it "can adjust a shift value" do
      key_manager = KeyManager.new
      offsets_manager = OffsetManager.new
      shift_1 = Shift.new(key_manager, offsets_manager)

      shift_value_1 = 97
      shift_value_2 = -16

      expect(shift_1.adjust_shift_value(shift_value_1)).to eq(16)
      expect(shift_1.adjust_shift_value(shift_value_1)).to be_an(Integer)
    end

    it "can check new index location" do
      key_manager = KeyManager.new
      offsets_manager = OffsetManager.new
      shift_1 = Shift.new(key_manager, offsets_manager)

      new_index_location_1 = 4
      new_index_location_2 = 32
      new_index_location_3 = -3

      expect(shift_1.check_new_index_location(new_index_location_1)).to eq(4)
      expect(shift_1.check_new_index_location(new_index_location_2)).to eq(5)
      expect(shift_1.check_new_index_location(new_index_location_3)).to eq(24)
      expect(shift_1.check_new_index_location(new_index_location_3)).to be_an(Integer)
      expect(shift_1.check_new_index_location(new_index_location_3)).to be_an(Integer)
      expect(shift_1.check_new_index_location(new_index_location_3)).to be_an(Integer)
    end
end
