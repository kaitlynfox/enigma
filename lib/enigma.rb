require 'date'

class Enigma

  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

# Enigma Interface
  def encrypt(message, key, date)
    downcased_message = message.downcase

    characters = downcased_message.split("")

    shifts = generate_random_5_digit_number

    current_shift_index = 0
    map_stuff = characters.map do |character|
      current_shift = shifts[current_shift_index]
      new_character = shift_character(character, current_shift)

    # set the message's characters to be their own individual key and the
    # shifted character to be the value.

      # The encrypt method returns a hash with three keys:
      #
      # :encryption => the encrypted String
      # :key => the key used for encryption as a String
      # :date => the date used for encryption as a String in the form DDMMYY

      hash = {
                encryption: "encrypted string",
                key: key,
                date: date
      }
    end
  end

# Enigma Interface
  def decrypt(ciphertext, key, date)
    # The decrypt method returns a hash with three keys:
    #   :decryption => the decrypted String
    #   :key => the key used for decryption as a String
    #   :date => the date used for decryption as a String in the form DDMMYY
  end
    # inherit from fileworker class (reading/writing from class)?
end
