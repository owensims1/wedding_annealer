module Annealing
  class WeddingAnnealer
    DEFAULT_TIME = 50_000

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
      puts ""
      puts "Current Time: #{current_time}"
      puts "============================="

      current_score = state.total_room_score
      puts "Current score: #{state.total_room_score}"

      temperature = temperature(time, current_time)
      puts "Current temperature: #{temperature}"

      next_state = state.rearrange
      next_score = next_state.total_room_score
      puts "Next score: #{next_score}"

      random_number = rand(0.0..1.0)
      puts "Random number: #{random_number}"

      if probability(current_score, next_score, temperature) > random_number
        puts "Next state ahoy!"
        self.state = next_state
      else
        puts "Rolling back"
        state.rollback
      end
    end

    def temperature(total_time, current_time)
      50 * Math.exp(0 - (5 * (current_time / total_time.to_f)))
    end

    def probability(initial_score, next_score, temperature)
      probability = Math.exp((initial_score - next_score) / temperature)
      puts "Probability: #{probability}"
      probability
    end
  end
end
