class KeyManager

  attr_reader :random_number

  def initialize(random_number = generate_random_5_digit_number)
    @random_number = random_number
  end

  def generate_random_5_digit_number
    5.times.map{rand(10)}.join
  end

  def keys
    keys = {
          a_key: @random_number[0, 2],
          b_key: @random_number[1, 2],
          c_key: @random_number[2, 2],
          d_key: @random_number[3, 2]
        }
  end

  def offsets

    # A Offset: first digit (4)
    # B Offset: Second digit (0)
    # C Offset: Third digit (4)
    # D Offset: Fourth digit (1)
    a_offset = last_four[0, 1]
    b_offset = last_four[1, 1]
    c_offset = last_four[2, 1]
    d_offset = last_four[3, 1]

    # Add key and Offset to get the shift
    # A shift = a_key + a_offset
    # B shift = b_key + b_offset
    # C shift = c_key + c_offset
    # D shift = d_key + d_offset
    a_shift = a_key.to_i + a_offset.to_i
    b_shift = b_key.to_i + b_offset.to_i
    c_shift = c_key.to_i + c_offset.to_i
    d_shift = d_key.to_i + d_offset.to_i

    shifts = [a_shift, b_shift, c_shift, d_shift]
  end

  # key generator
  # offset generator
  # shift generator
end
