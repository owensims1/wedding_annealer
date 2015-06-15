require "spec_helper"

describe Annealing::Seat do
  describe "#distance_to(other_seat)" do
    it "returns the distance between two seats, based on x,y" do
      seat_1 = Annealing::Seat.new(x: 1, y: 1)
      seat_2 = Annealing::Seat.new(x: 2, y: 2)

      distance = seat_1.distance_to(seat_2)

      expect(distance.round(2)).to eq(1.41)
    end
  end
end
