require './lib/enigma'

# Open the file to read from
file_to_read_from = File.open(ARGV[0], "r")

# Store the text read from the file
incoming_text = file_to_read_from.read

puts "incoming_text: #{incoming_text}"

# Close the door (handle)
file_to_read_from.close

# Open the file to write to
file_to_write_to = File.open(ARGV[1], "w")

# Create an instance of Enigma so the decrypt method can be called
enigma = Enigma.new

# Store the decrypted message
decrypted_message = enigma.decrypt(incoming_text, ARGV[2], ARGV[3])

puts "\ndecrypted_message: #{decrypted_message}"

# Write the decrypted message to the file
file_to_write_to.write(decrypted_message[:decryption])

# Close the file
file_to_write_to.close

puts "\nCreated '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
