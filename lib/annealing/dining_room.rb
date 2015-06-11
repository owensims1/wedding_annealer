module Annealing
  class DiningRoom
    def initialize(seating_chart)
      define_seats(seating_chart)
    end

    private

    def define_seats(seating_chart)
      seats = eval(seating_chart)
      seats.inject([]) { |seats, position| Annealing::Seat.new(position[0], position[1]) }
    end
  end
end
