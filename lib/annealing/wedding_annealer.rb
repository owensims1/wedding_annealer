module Annealing
  class WeddingAnnealer
    DEFAULT_TIME = 1

    attr_accessor :guests, :dining_room, :state

    def setup(guest_list, arrangement)
      self.guests = Annealing::Guest.load_all(guest_list)
      self.dining_room = Annealing::DiningRoom.new(guests, arrangement)
      dining_room.seat_guests
      self.state = dining_room
    end

    def anneal(time = DEFAULT_TIME)
      time.times do |current_time|
        anneal_step(time, current_time)
      end
    end

    private

    def anneal_step(time, current_time)
      current_score = state.total_room_score
      binding.pry
      #...
    end
  end
end
