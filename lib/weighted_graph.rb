require 'weighted_graph/version'

# A simple graph with weighted edges
module WeightedGraph
  # Graph API
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

    def remove_edge(source, destination)
      @edges[source].delete(destination) if @edges.key?(source)
    end

    def contains_edge?(source, destination)
      @edges.key?(source) && @edges[source].key?(destination)
    end

    def get_edge_weight(source, destination)
      if contains_edge?(source, destination)
        @edges[source][destination]
      else
        Float::INFINITY
      end
    end
  end
end
