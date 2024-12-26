require_relative 'support/helper'

require_relative '../../level1/rental'
require_relative '../../level1/car'

data = { "id" => 1, "car_id" => 1, "start_date" => "2017-12-8", "end_date" => "2017-12-10", "distance" => 100 }

rental = Rental.new(data)

assert rental.is_a?(Rental)
assert rental.id == 1
assert rental.car.is_a?(Car)
assert rental.car == Car.find(id: 1)
assert rental.start_date == Date.new(2017, 12, 8)
assert rental.end_date == Date.new(2017, 12, 10)
assert rental.distance == 100

assert rental.price.is_a?(Integer)
assert rental.price == 7000

data2 = { "id" => 2, "car_id" => 1, "start_date" => "2017-12-14", "end_date" => "2017-12-18", "distance" => 550 }

rental2 = Rental.new(data2)

assert rental2.price == 15500

data3 = { "id" => 3, "car_id" => 2, "start_date" => "2017-12-8", "end_date" => "2017-12-10", "distance" => 150 }

input_path = File.join(File.dirname(__FILE__), "files/input.json")
Rental.input_path = input_path
assert Rental.all == [rental, rental2, Rental.new(data3)]
