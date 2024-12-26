require 'date'
require 'json'
require_relative 'conf'

input = File.read("#{ABSOLUTE_ROOT_PATH}level1/data/input.json")

parsed_input = JSON.parse(input)

cars = parsed_input["cars"]
rentals = parsed_input["rentals"]

result = { rentals: [] }
rentals.each do |rental|
  current_rental = { id: rental["id"] }
  current_rental_car = cars.detect { |car| car["id"] == rental["car_id"] }

  current_rental_days_duration = Date.parse(rental["end_date"]) - Date.parse(rental["start_date"]) + 1 # Last day included
  current_rental_duration_price = current_rental_days_duration * current_rental_car["price_per_day"]

  current_rental_distance_price = rental["distance"] * current_rental_car["price_per_km"]

  current_rental[:price] = (current_rental_duration_price + current_rental_distance_price).to_i

  result[:rentals] << current_rental
end

File.open("#{ABSOLUTE_ROOT_PATH}level1/data/output.json", "w") do |file|
  file.puts JSON.pretty_generate(result)
end
