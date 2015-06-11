module Annealing
  class DiningRoom
    attr_accessor :seats, :guests

    def initialize(guests, arrangement)
      @guests = guests
      define_seats(arrangement)
    end

    def seat_guests
      guests.each_with_index do |guest, index|
        seats[index].guest = guest
      end
    end

    private

    def define_seats(arrangement)
      seats = eval(arrangement)
      self.seats = seats.map { |position| Annealing::Seat.new(x: position[0], y: position[1]) }
    end
  end
end
