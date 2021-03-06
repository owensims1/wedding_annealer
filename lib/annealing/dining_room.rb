module Annealing
  class DiningRoom
    MAX_NEIGHBOR_DISTANCE = 1.5

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

    def total_room_score
      seated_neighbors.reduce(0) do |score, neighbors|
        score + neighbors[0].guest.compatibility_with(neighbors[1].guest)
      end
    end

    def rearrange
      seat_1 = seats.sample
      seat_2 = seats.sample #These could end up being the same, which is fine, but results in a wasted cycle
      guest_1 = seat_1.guest
      seat_1.guest = seat_2.guest
      seat_2.guest = guest_1
      @swapped_seats = [seat_1, seat_2]
      self
    end

    def rollback
      seat_1, seat_2 = @swapped_seats
      guest_1 = seat_1.guest
      seat_1.guest = seat_2.guest
      seat_2.guest = guest_1
    end

    private

    def define_seats(arrangement)
      seats = eval(arrangement)
      self.seats = seats.map { |position| Annealing::Seat.new(x: position[0], y: position[1]) }
    end

    def seated_neighbors
      guest_pairs = seats.combination(2)
      guest_pairs.select { |guest_pair| guest_pair[0].distance_to(guest_pair[1]) <= MAX_NEIGHBOR_DISTANCE}
    end

  end
end
