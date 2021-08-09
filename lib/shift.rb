require './lib/key_manager'
require './lib/offset_manager'

class Shift

  attr_reader :keys,
              :offsets

  def initialize(key_manager, offsets_manager)
    @keys = key_manager.keys
    @offsets = offsets_manager.offsets
  end

  def shift
    # shift_hash = {
    #                 a_shift: @keys[:a_key].to_i + @offsets[:a_offset].to_i,
    #                 b_shift: @keys[:b_key].to_i + @offsets[:b_offset].to_i,
    #                 c_shift: @keys[:c_key].to_i + @offsets[:c_offset].to_i,
    #                 d_shift: @keys[:c_key].to_i + @offsets[:c_offset].to_i
    #               }

    a_shift = @keys[:a_key].to_i + @offsets[:a_offset].to_i
    b_shift = @keys[:b_key].to_i + @offsets[:b_offset].to_i
    c_shift = @keys[:c_key].to_i + @offsets[:c_offset].to_i
    d_shift = @keys[:c_key].to_i + @offsets[:c_offset].to_i

    shifts = [a_shift, b_shift, c_shift, d_shift]
  end
end
