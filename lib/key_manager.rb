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
end
