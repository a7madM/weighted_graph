require 'weighted_graph/version'

# A simple graph with weighted edges
module WeightedGraph
  class Graph
    def initialize(edges = Hash.new(0))
      @edges = edges
    end

    def add_edge(source, destination, weight)
      if @edges.key?(source)
        @edges[source][destination] = weight
      else
        @edges[source] = { destination => weight }
      end
    end

    def get_edge_weight(source, destination)
      if @edges.key?(source) && @edges[source].key?(destination)
        @edges[source][destination]
      else
        Float::INFINITY
      end
    end
  end
end
