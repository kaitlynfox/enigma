require 'date'
require './lib/shift'
require './lib/key_manager'
require './lib/offset_manager'

class Enigma

  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
    @key_manager = KeyManager.new
    @offset_manager = OffsetManager.new
  end

  # Create a Shift since there could be either a passed in key/date
  # or there could be random key/date
  # Set the shift with the key/date
  def encrypt(message, key = @key_manager.random_number, date = @offset_manager.generate_todays_date)
    # key_manager = KeyManager.new(key)
    # offset_manager = OffsetManager.new(date)
    # shift_manager = Shift.new(key_manager, offset_manager)
    shift_manager = create_managers(key, date)
    # downcased_message = downcase_message(message)
    # characters = downcased_message.split("")
    characters = downcase_message_and_split(message)
    array_of_shifts = shift_manager.shift

    array_of_shifts_index_tracker = 0
    encrypted_message = characters.map do |character|
        if array_of_shifts_index_tracker > 3
          array_of_shifts_index_tracker = 0
        end
      new_character = shift_manager.shift_character(character, array_of_shifts[array_of_shifts_index_tracker], @character_set)
      array_of_shifts_index_tracker += 1
      new_character
    end

    hash = {
              encryption: encrypted_message.join,
              key: key,
              date: date
    }
  end

  def downcase_message_and_split(message)
    message.downcase.split("")
  end

  def create_managers(key, date)
    key_manager = KeyManager.new(key)
    offset_manager = OffsetManager.new(date)
    shift_manager = Shift.new(key_manager, offset_manager)
  end

  def downcase_message(message)
    message.downcase
  end

  def decrypt(ciphertext, key, date = @offset_manager.generate_todays_date)
    shift_manager = create_managers(key, date)
    characters = downcase_message_and_split(ciphertext)
    array_of_shifts = shift_manager.shift
    array_of_negative_shifts = set_array_shift_values_negative(array_of_shifts)

    array_of_shifts_index_tracker = 0
    encrypted_message = characters.map do |character|
        if array_of_shifts_index_tracker > 3
          array_of_shifts_index_tracker = 0
        end
      new_character = shift_manager.shift_character(character, array_of_negative_shifts[array_of_shifts_index_tracker], @character_set)
      array_of_shifts_index_tracker += 1
      new_character
    end

    hash = {
            decryption: "hello world",
            key: "02715",
            date: "040895"
          }

  end

  def set_array_shift_values_negative(array)
    array.map do |shift|
      -(shift)
    end
  end
end

#     # inherit from fileworker class (reading/writing from class)?
