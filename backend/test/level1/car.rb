require_relative 'support/helper'

require_relative '../../level1/car'

data = { "id" => 1, "price_per_day" => 3000, "price_per_km" => 10 }

car = Car.new(data)

assert car.id == 1
assert car.price_per_day == 3000
assert car.price_per_km == 10

input_path = File.join(File.dirname(__FILE__), "files/input.json")
Car.input_path = input_path
assert car == Car.find(id: 1)
assert Car.new({}) != Car.new({})
