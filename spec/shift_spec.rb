require './lib/shift'
require './lib/key_manager'
require './lib/offset_manager'

RSpec.describe Shift do
  it "exists" do
    # key is a Hash
    # offset is a Hash
    shift_1 = Shift.new(keys_hash, offset_hash)

    expect(shift_1).to be_a(Shift)
  end
end
