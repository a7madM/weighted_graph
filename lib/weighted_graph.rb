require 'weighted_graph/version'

# A simple graph with weighted edges
module WeightedGraph
  # Graph API
  class Graph
    # Initialize a graph with an optional adjacency list
    def initialize(edges = Hash.new(0))
      @edges = edges
    end

    # Add directed edge (source, destination) to the graph with given weight
    def add_edge(source, destination, weight)
      if @edges.key?(source)
        @edges[source][destination] = weight
      else
        @edges[source] = { destination => weight }
      end
    end

    # Add undirected edge (vertex_a, vertex_b) to the graph with given weight
    def add_undirected_edge(vertex_a, vertex_b, weight)
      add_edge(vertex_a, vertex_b, weight)
      add_edge(vertex_b, vertex_a, weight)
    end

    # Remove directed edge (source, destination) from the graph
    def remove_edge(source, destination)
      @edges[source].delete(destination) if @edges.key?(source)
    end

    # Remove undirected edge (vertex_a, vertex_b) from the graph
    def remove_undirected_edge(vertex_a, vertex_b)
      remove_edge(vertex_a, vertex_b)
      remove_edge(vertex_b, vertex_a)
    end

    # Return true iff the graph contains directed edge (source, destination)
    def contains_edge?(source, destination)
      @edges.key?(source) && @edges[source].key?(destination)
    end

    # Returns the weight of directed edge (source, destination),
    # or returns Float::INFINITY if no such edge exists
    def get_edge_weight(source, destination)
      if contains_edge?(source, destination)
        @edges[source][destination]
      else
        Float::INFINITY
      end
    end
  end
end
