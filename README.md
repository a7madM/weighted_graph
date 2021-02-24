# weighted_graph

weighted_graph is a simple Ruby library for working on graphs with weighted edges.

## WeightedGraph::Graph API

```ruby
# Add directed edge (source, destination) to the graph with given weight
add_edge(source, destination, weight)

# Add undirected edge (vertex_a, vertex_b) to the graph with given weight
add_undirected_edge(vertex_a, vertex_b, weight)

# Remove directed edge (source, destination) from the graph
remove_edge(source, destination)

# Remove undirected edge (vertex_a, vertex_b) from the graph
remove_undirected_edge(vertex_a, vertex_b)

# Return true iff the graph contains directed edge (source, destination)
contains_edge?(source, destination)

# Returns the weight of directed edge (source, destination),
# or returns Float::INFINITY if no such edge exists
get_edge_weight(source, destination)

# Returns the set of vertices v_i where edge (source, v_i) is in the graph
get_adjacent_vertices(source)

# Returns a list of nodes of the graph
nodes()
```

## WeightedGraph::PositiveWeightedGraph API

WeightedGraph::PositiveWeightedGraph extends WeightedGraph::Graph and shares its behaviour, with the following differences:

```ruby
# Add directed edge (source, destination) to the graph with given weight
# Requires that weight is a positive number
add_edge(source, destination, weight)

# Add undirected edge (vertex_a, vertex_b) to the graph with given weight
# Requires that weight is a positive number
add_undirected_edge(vertex_a, vertex_b, weight)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weighted_graph'
```

## Usage

```ruby
require 'weighted_graph'

graph = WeightedGraph::Graph.new
graph.add_undirected_edge('Burnaby', 'Vancouver', 10)
graph.add_edge('Burnaby', 'Port Coquitlam', 23)
graph.add_edge('Vancouver', 'Langley', 37)
graph.add_undirected_edge('Langley', 'Port Coquitlam', 35)

adj_cities_to_van = graph.get_adjacent_vertices('Vancouver')
# => #<Set: { 'Burnaby', 'Langley' }>

graph.contains_edge?('Vancouver', 'Port Coquitlam')
# => false

graph.get_edge_weight('Vancouver', 'Port Coquitlam')
# => Infinity

graph.get_edge_weight('Vancouver', 'Burnaby')
# => 10
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/msayson/weighted_graph.

## License

The weighted_graph library is open source and available under the terms of the [MIT License](http://opensource.org/licenses/MIT).
