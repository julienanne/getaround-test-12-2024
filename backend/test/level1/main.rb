require_relative '../../level1/conf'

expected_file_path = "#{ABSOLUTE_ROOT_PATH}level1/data/expected_output.json"

expected_output = File.read(expected_file_path)

require "#{ABSOLUTE_ROOT_PATH}level1/main.rb" # Direct execution

output_file_path = "#{ABSOLUTE_ROOT_PATH}level1/data/output.json"

output = File.read(output_file_path)

if output == expected_output
  puts "GREEN"
else
  puts "RED"
end
