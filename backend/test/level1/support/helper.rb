class AssertionError < StandardError; end

def assert(condition)
  unless condition
    puts "RED"
    fail AssertionError
  else
    puts "GREEN"
  end
end

