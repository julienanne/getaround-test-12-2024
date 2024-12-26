require 'json'

require_relative 'rental'

result =
  Rental.all.map do |rental|
    { id: rental.id, price: rental.price }
  end

File.open(File.join(File.dirname(__FILE__), "data/output.json"), "w") do |file|
  file.puts JSON.pretty_generate({ rentals: result })
end
