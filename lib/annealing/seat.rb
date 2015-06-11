module Annealing
  class Seat
  attr_accessor :guest

    def initialize(x:, y:, guest: nil)
      @x = x
      @y = y
      @guest = guest
    end
  end
end
