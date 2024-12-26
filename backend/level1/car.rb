require 'json'

class Car
  @input_path = File.join(File.dirname(__FILE__), "data/input.json")

  attr_reader :id, :price_per_day, :price_per_km

  def initialize(data)
    @id = data["id"]
    @price_per_day = data["price_per_day"]
    @price_per_km = data["price_per_km"]
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

    def find(id:)
      all.detect { |car| car.id == id }
    end

    private

    def all
      input = File.read(@input_path)
      parsed_input = JSON.parse(input)
      parsed_input["cars"].map { |car_input| new(car_input) }
    end
  end
end
