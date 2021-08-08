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
end
