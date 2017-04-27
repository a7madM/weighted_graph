require 'spec_helper'

# Positive-weighted graph API tests
module WeightedGraph
  describe PositiveWeightedGraph do
    before do
      @graph = WeightedGraph::PositiveWeightedGraph.new
    end

    describe '.add_edge' do
      it 'successfully adds positive-weight edges' do
        expect(@graph.contains_edge?('A', 'B')).to be false
        @graph.add_edge('A', 'B', 5)
        expect(@graph.contains_edge?('A', 'B')).to be true
      end
      it 'does not add non-positive-weight edges' do
        expect(@graph.contains_edge?('A', 'B')).to be false
        @graph.add_edge('A', 'B', -5)
        expect(@graph.contains_edge?('A', 'B')).to be false
        @graph.add_edge('C', 'D', 0)
        expect(@graph.contains_edge?('C', 'D')).to be false
      end
    end

    describe '.add_undirected_edge' do
      it 'successfully adds positive-weight edges' do
        expect(@graph.contains_edge?('A', 'B')).to be false
        @graph.add_undirected_edge('A', 'B', 5)
        expect(@graph.contains_edge?('A', 'B')).to be true
        expect(@graph.contains_edge?('B', 'A')).to be true
      end
      it 'does not add non-positive-weight edges' do
        expect(@graph.contains_edge?('A', 'B')).to be false
        @graph.add_undirected_edge('A', 'B', -5)
        expect(@graph.contains_edge?('A', 'B')).to be false
        expect(@graph.contains_edge?('B', 'A')).to be false
        @graph.add_undirected_edge('C', 'D', 0)
        expect(@graph.contains_edge?('C', 'D')).to be false
        expect(@graph.contains_edge?('D', 'C')).to be false
      end
    end
  end
end
