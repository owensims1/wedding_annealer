module Annealing
  class Guest
    def initialize(name, answer_array)
      @name = name
      @answer_array = answer_array
    end

    def self.load_all(file)
      CSV.foreach(file, headers: true).inject([]) do |guests, row|
        guests << Guest.new(row["name"], [row["drinks"].to_i, row["age"].to_i])
      end
    end
  end
end
