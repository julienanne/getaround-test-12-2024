require_relative 'support/helper'

expected_file_path = File.join(File.dirname(__FILE__), "../../level1/data/input.json")

expected_output = File.read(expected_file_path)

require File.expand_path(File.join(File.dirname(__FILE__), "../../level1/main.rb"))

output_file_path = File.join(File.dirname(__FILE__), "../../level1/data/input.json")

output = File.read(output_file_path)

assert output == expected_output
