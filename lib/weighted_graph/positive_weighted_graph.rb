require_relative './graph'

# A simple graph with weighted edges
module WeightedGraph
  # API for a graph that requires positive edge weights
  class PositiveWeightedGraph < WeightedGraph::Graph
    # Initialize an empty adjacency list for edges
    def initialize
      super(Hash.new(0))
    end

    # Add directed edge (source, destination) to the graph with given weight
    # Requires that weight is a positive number
    def add_edge(source, destination, weight)
      super(source, destination, weight) if weight > 0
    end

    # Add undirected edge (vertex_a, vertex_b) to the graph with given weight
    # Requires that weight is a positive number
    def add_undirected_edge(vertex_a, vertex_b, weight)
      super(vertex_a, vertex_b, weight) if weight > 0
    end
  end
end
