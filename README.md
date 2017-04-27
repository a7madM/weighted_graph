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
```

<!-- TODO: Add installation section after publishing the gem.
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weighted_graph'
```

Or install it yourself as:

    $ gem install weighted_graph -->

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/msayson/weighted_graph.

## License

The weighted_graph library is open source and available under the terms of the [MIT License](http://opensource.org/licenses/MIT).
