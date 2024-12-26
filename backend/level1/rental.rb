require 'date'

require_relative 'car'

class Rental
  @input_path = File.join(File.dirname(__FILE__), "data/input.json")

  attr_reader :id, :car, :start_date, :end_date, :distance

  def initialize(data)
    @id = data["id"]
    @car_id = data["car_id"]
    @car = Car.find(id: @car_id)
    @start_date = Date.parse(data["start_date"])
    @end_date = Date.parse(data["end_date"])
    @distance = data["distance"]
  end

  def price
    (duration_price + distance_price).to_i
  end

  def ==(other)
    if @id && @id == other.id
      true
    else
      super
    end
  end

  class << self
    def input_path=(path)
      @input_path = path
    end

    def all
      input = File.read(@input_path)
      parsed_input = JSON.parse(input)
      rentals = parsed_input["rentals"]
      rentals.map { |rental_data| new(rental_data) }
    end
  end

  private

    def duration_price
      duration * price_per_day
    end

    def duration
      @end_date - @start_date + 1 # end_date included
    end

    def price_per_day
      @car.price_per_day
    end


    def distance_price
      distance * price_per_km
    end

    def price_per_km
      @car.price_per_km
    end
end
