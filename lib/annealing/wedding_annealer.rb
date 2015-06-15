module Annealing
  class WeddingAnnealer
    DEFAULT_TIME = 10

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
      temperature = temperature(time, current_time)

      next_state = state.rearrange
      next_score = next_state.total_room_score

      if probability(current_score, next_score, temperature) > rand(0.0..1.0)
        self.state = next_state
      else
        state.rollback
      end
    end

    def temperature(total_time, current_time)
      50 * Math.exp(0 - (5 * (current_time / total_time.to_f)))
    end

    def probability(score_1, score_2, temperature)
      Math.exp((score_1 - score_2) / temperature)
    end
  end
end
