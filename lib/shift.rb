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
    a_shift = @keys[:a_key].to_i + @offsets[:a_offset].to_i
    b_shift = @keys[:b_key].to_i + @offsets[:b_offset].to_i
    c_shift = @keys[:c_key].to_i + @offsets[:c_offset].to_i
    d_shift = @keys[:c_key].to_i + @offsets[:c_offset].to_i

    shifts = [a_shift, b_shift, c_shift, d_shift]
  end

# Shift a character by however much the shift is to the right
# Will return the new character
  def shift_character(character, shift, character_set)
    starting_point = character_set.index(character)

    if starting_point.nil?
      return character
    end

    adjusted_shift_value = adjust_shift_value(shift)
    new_index_location = starting_point + adjusted_shift_value
    new_index_location = check_new_index_location(new_index_location)
    character_set[new_index_location]
  end

  def adjust_shift_value(shift)
    if shift > 27
      return (shift % 27)
    end
    shift
  end

  def check_new_index_location(new_index_location)
    if new_index_location > 27
      new_index_location = new_index_location - 27
    end
    new_index_location
  end
end
