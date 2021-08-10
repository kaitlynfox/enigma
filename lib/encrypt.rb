require './lib/enigma'

# Select a file to read from
file_to_read_from = File.open(ARGV[0], "r")

# Read from the file and store its contents in incoming_text
incoming_text = file_to_read_from.read

# Close the door (handle) after reading
file_to_read_from.close

# Select a file to write to
file_to_write_to = File.open(ARGV[1], "w")

# Create an instance of Enigma as to call the encrypt function
enigma = Enigma.new

# Pass in the text from the file being read
encrypted_message = enigma.encrypt(incoming_text)

# Write the encrypted message to the file
file_to_write_to.write(encrypted_message[:encryption])

# Close the door(handle)
file_to_write_to.close

puts "\nCreated: '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
