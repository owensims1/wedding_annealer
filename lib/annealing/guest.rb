module Annealing
  class Guest
    attr_reader :answer_array

    def initialize(name, answer_array)
      @name = name
      @answer_array = answer_array
    end

    def self.load_all(file)
      CSV.foreach(file, headers: true).inject([]) do |guests, row|
        guests << Guest.new(row["name"], [row["drinks"].to_i, row["age"].to_i])
      end
    end

    # Measures differences in answers. Lower is better.
    def compatibility_with(other_guest)
      answer_pairs = answer_array.zip(other_guest.answer_array)
      answer_pairs.reduce(0) { |score, answer| score + (answer[0] - answer[1]).abs }
    end
  end
end
