module Annealing
  class WeddingAnnealer
    attr_accessor :guests
    def setup(guest_list, seating_chart)
      self.dining_room = Annealing::DiningRoom.new(seating_chart)
      self.guests = Annealing::Guest.load_all(guest_list)
      p guests
    end
  end
end
