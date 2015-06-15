module Annealing
  class Seat
    attr_accessor :guest
    attr_reader :x, :y

    def initialize(x:, y:, guest: nil)
      @x = x
      @y = y
      @guest = guest
    end

    def distance_to(other_seat)
      x_distance = x - other_seat.x
      y_distance = y - other_seat.y
      Math.sqrt((x_distance ** 2) + (y_distance ** 2))
    end
  end
end
