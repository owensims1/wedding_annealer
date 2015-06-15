require "spec_helper"

describe Annealing::Guest do
  describe "#compatibility_with" do
    it "returns the sum of the differences in answers" do
      guest_1 = described_class.new("bob", [1, 2])
      guest_2 = described_class.new("steve", [3, 2])

      guest_3 = described_class.new("jack", [3, 2])
      guest_4 = described_class.new("jill", [3, 2])

      guest_5 = described_class.new("harold", [5, 1])
      guest_6 = described_class.new("jumar", [1, 5])


      expect(guest_1.compatibility_with(guest_2)).to eq(2)
      expect(guest_3.compatibility_with(guest_4)).to eq(0)
      expect(guest_5.compatibility_with(guest_6)).to eq(8)
    end
  end
end
