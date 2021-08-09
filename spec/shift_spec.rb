require './lib/shift'
require './lib/key_manager'
require './lib/offset_manager'

RSpec.describe Shift do
  it "exists" do
    # key is a Hash
    # offset is a Hash

    # Create an instance of KeyManager
    # to get the keys to pass into Shift
    key_manager = KeyManager.new
    # Create an instance of OffsetManager
    # to get the keys to pass into Shift
    offsets_manager = OffsetManager.new

    shift_1 = Shift.new(key_manager, offsets_manager)

    expect(shift_1).to be_a(Shift)
  end

  it "can add keys and offsets together to create individual shifts" do
    # key is a Hash
    # offset is a Hash

    # Create an instance of KeyManager to get the keys to pass into Shift
    # Create an instance of OffsetManager to get the keys to pass into Shift
    key_manager = KeyManager.new
    offsets_manager = OffsetManager.new

    # Create a shift that takes in keys and offsets
    shift_1 = Shift.new(key_manager, offsets_manager)

    # example = {
    #               a_shift: 87,
    #               b_shift: 38,
    #               c_shift: 87,
    #               d_shift: 33
    #             }

    # expect(shift_1.shift).to be_a(Hash)
    # expect(shift_1.shift.size).to eq(4)
    # expect(shift_1.shift[:a_shift]).to be_an(Integer)
    # expect(shift_1.shift[:b_shift]).to be_an(Integer)
    # expect(shift_1.shift[:c_shift]).to be_an(Integer)
    # expect(shift_1.shift[:d_shift]).to be_an(Integer)

    expect(shift_1.shift).to be_an(Array)
    expect(shift_1.shift.size).to eq(4)
    shift_1.shift.each do |shift|
      expect(shift).to be_an(Integer)
    end
  end
end
