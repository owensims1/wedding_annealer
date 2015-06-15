$: << "."
$: << "./lib"
require "annealing"

annealer = Annealing::WeddingAnnealer.new
annealer.setup("guest_list.csv", File.read("seating_chart.txt"))

annealer.anneal

binding.pry
