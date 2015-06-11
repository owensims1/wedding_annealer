module Annealing
  class WeddingAnnealer
    attr_accessor :guests, :dining_room

    def setup(guest_list, arrangement)
      self.guests = Annealing::Guest.load_all(guest_list)
      self.dining_room = Annealing::DiningRoom.new(guests, arrangement)
      dining_room.seat_guests
    end
  end
end
